import os
import re

SCREENS_DIR = r"c:\Users\Giffari\Pictures\Koperasi v3\koperasi_mobile\lib\screens"

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    rel_path = os.path.relpath(filepath, SCREENS_DIR)
    depth = rel_path.count(os.sep)
    import_path = "../" * (depth + 1) + "utils/api_service.dart"
    
    modified = False

    if 'http.get' in content or 'http.post' in content or 'http.put' in content or 'http.delete' in content or 'http.MultipartRequest' in content:
        if import_path not in content:
            if "import 'package:http/http.dart' as http;" in content:
                content = content.replace("import 'package:http/http.dart' as http;", f"import 'package:http/http.dart' as http;\nimport '{import_path}';")
            else:
                content = f"import '{import_path}';\n" + content
            modified = True

        if 'http.get(' in content:
            content = content.replace('http.get(', 'ApiService.get(')
            modified = True
            
        if 'http.post(' in content:
            content = content.replace('http.post(', 'ApiService.post(')
            modified = True
            
        if 'http.put(' in content:
            content = content.replace('http.put(', 'ApiService.put(')
            modified = True
            
        if 'http.delete(' in content:
            content = content.replace('http.delete(', 'ApiService.delete(')
            modified = True

        if 'http.MultipartRequest(' in content:
            pattern = r"((?:var|final)?\s*request\s*=\s*http\.MultipartRequest\([^;]+;)"
            replacement = r"\1\n      ApiService.addAuthHeaderToMultipart(request);"
            new_content = re.sub(pattern, replacement, content)
            if new_content != content:
                content = new_content
                modified = True

    if modified:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Modified {filepath}")

for root, dirs, files in os.walk(SCREENS_DIR):
    for file in files:
        if file.endswith('.dart'):
            process_file(os.path.join(root, file))
