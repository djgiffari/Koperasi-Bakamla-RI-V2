const http = require('http');

async function request(method, path, data = null, token = null) {
  return new Promise((resolve, reject) => {
    const dataString = data ? JSON.stringify(data) : '';
    const options = {
      hostname: 'localhost',
      port: 3000,
      path: path,
      method: method,
      headers: {
        'Content-Type': 'application/json',
      }
    };

    if (token) {
      options.headers['Authorization'] = `Bearer ${token}`;
    }
    if (data) {
      options.headers['Content-Length'] = Buffer.byteLength(dataString);
    }

    const req = http.request(options, (res) => {
      let responseBody = '';
      res.on('data', (chunk) => responseBody += chunk);
      res.on('end', () => {
        try {
          const parsed = JSON.parse(responseBody);
          resolve({ status: res.statusCode, body: parsed });
        } catch (e) {
          resolve({ status: res.statusCode, body: responseBody });
        }
      });
    });

    req.on('error', (e) => reject(e));
    if (data) req.write(dataString);
    req.end();
  });
}

async function runTests() {
  console.log('=== STARTING E2E QA & QC TEST ===\n');

  // 1. REGISTRATION PHASE
  console.log('[1] Testing Registration Validation (Empty NIP, Invalid Email, Weak Password)');
  let res = await request('POST', '/api/auth/register-mobile', {
    nip: '',
    namaLengkap: '',
    email: 'invalid-email',
    password: '123'
  });
  console.log(`Status: ${res.status}`);
  console.log(`Response:`, res.body);
  if (res.status === 200) {
    console.error('--> BUG FOUND: No validation on backend! Empty NIP and weak password allowed.');
  }

  // Register valid account
  const timestamp = Date.now();
  const testNip = `NIP${timestamp}`;
  const testEmail = `test${timestamp}@example.com`;
  
  console.log('\n[2] Registering valid mobile account');
  res = await request('POST', '/api/auth/register-mobile', {
    nip: testNip,
    namaLengkap: 'Test QA User',
    email: testEmail,
    password: 'Password123'
  });
  console.log(`Status: ${res.status}`);
  console.log(`Response:`, res.body);
  
  // 2. LOGIN PHASE
  console.log('\n[3] Testing Login with newly registered account (Should wait for Admin approval)');
  let loginRes = await request('POST', '/api/auth/login-mobile', {
    nip: testNip,
    password: 'Password123'
  });
  console.log(`Status: ${loginRes.status}`);
  console.log(`Response:`, loginRes.body);
  
  if (loginRes.status === 403 && loginRes.body.error.includes('MENUNGGU_PERSETUJUAN')) {
    console.log('--> Working correctly: Status is MENUNGGU_PERSETUJUAN.');
  } else {
    console.error('--> BUG FOUND: Login behaviour for unapproved user is incorrect or they are immediately active!');
  }

  // Admin login to approve
  console.log('\n[4] Login as Admin');
  const adminLoginRes = await request('POST', '/api/auth/login', {
    username: 'admin',
    password: 'password123' // assuming default password based on common patterns
  });
  console.log(`Status: ${adminLoginRes.status}`);
  console.log(`Response:`, adminLoginRes.body);
  
  let adminToken = adminLoginRes.body.token;

  if (adminToken) {
     // Approve user
     console.log('\n[5] Approving the new user (Admin)');
     const approveRes = await request('PUT', `/api/anggota/${res.body.user?.id || 1}`, {
       status: 'AKTIF'
     }, adminToken);
     console.log(`Approve status: ${approveRes.status}`);
     
     // Login again
     loginRes = await request('POST', '/api/auth/login-mobile', {
        nip: testNip,
        password: 'Password123'
     });
     console.log(`\n[6] Login again as active user. Status: ${loginRes.status}`);
  }

  console.log('\n=== END OF QA & QC TEST ===');
}

runTests();
