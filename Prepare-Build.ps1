# Remove old try
Remove-Item -Path /app/nginx-proxy-manager -Recurse -Force -ErrorAction SilentlyContinue

# Clone Repo and checkout branch
git clone https://github.com/NginxProxyManager/nginx-proxy-manager.git
git checkout openidc

# Run /scripts/frontend-build
chmod u+x ./nginx-proxy-manager/scripts/frontend-build
sh ./nginx-proxy-manager/scripts/frontend-build