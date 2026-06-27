import { Request, Response, NextFunction } from 'express';
import prisma from './prisma';

export const auditLog = (action: string, entityName: string) => {
  return async (req: Request, res: Response, next: NextFunction) => {
    // We capture the original send to log after response is sent
    const originalSend = res.json;
    
    res.json = function(body) {
      res.locals.responseBody = body;
      return originalSend.call(this, body);
    };

    res.on('finish', async () => {
      // Only log successful mutating actions
      if (res.statusCode >= 200 && res.statusCode < 300 && req.method !== 'GET') {
        try {
          // Attempt to extract user id from decoded token (assuming auth middleware sets it)
          const userId = (req as any).user?.id || null;
          
          // Determine entity ID from params or response
          let entityId = req.params.id || res.locals.responseBody?.data?.id || res.locals.responseBody?.id || 'UNKNOWN';
          
          await prisma.auditTrail.create({
            data: {
              userId,
              action: `${req.method} ${action}`,
              entityName,
              entityId: String(entityId),
              newData: JSON.stringify(req.body),
              ipAddress: req.ip,
              userAgent: req.headers['user-agent']
            }
          });
        } catch (err) {
          console.error('Failed to write audit trail:', err);
        }
      }
    });

    next();
  };
};
