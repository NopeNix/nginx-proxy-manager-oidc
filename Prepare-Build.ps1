# Remove old try
if (Test-path ./nginx-proxy-manager/){ 
    Write-Host "Removing old Files..." -ForegroundColor Blue
    Remove-Item -Path ./nginx-proxy-manager/ -Recurse -Force
}


# Clone Repo and checkout branch
Write-Host "Cloning Repo..." -ForegroundColor Blue
git clone https://github.com/NginxProxyManager/nginx-proxy-manager.git
cd ./nginx-proxy-manager
git checkout openidc
cd ..

# Change Image name in frontend-build File and dockerfile
Write-Host "Changing Image Name in frontend-build File and dockerfile..." -ForegroundColor Blue
((Get-Content ./nginx-proxy-manager/scripts/frontend-build).replace('jc21/nginx-full:node', 'nginxproxymanager/nginx-full:certbot-node') | Set-Content ./nginx-proxy-manager/scripts/frontend-build)
((Get-Content ./nginx-proxy-manager/docker/Dockerfile).replace('nginxproxymanager/nginx-full:node', 'nginxproxymanager/nginx-full:certbot-node') | Set-Content ./nginx-proxy-manager/docker/Dockerfile)

# Getting latest package.json file
Write-Host "Getting latest package.json File.." -ForegroundColor Blue
curl -s -o ./nginx-proxy-manager/frontend/package.json https://raw.githubusercontent.com/NginxProxyManager/nginx-proxy-manager/master/frontend/package.json

# Run /scripts/frontend-build
Write-Host "Running Frontent Build Script..." -ForegroundColor Blue
chmod u+x ./nginx-proxy-manager/scripts/frontend-build
cd ./nginx-proxy-manager/scripts
sh ./frontend-build
cd ../../

Write-Host "######################################" -ForegroundColor Blue
Write-Host "### Prepare-Build Script Finished! ###" -ForegroundColor Blue
Write-Host "######################################" -ForegroundColor Blue