$ErrorActionPreference = 'Stop';
$files = ""
Write-Host Starting build

Write-Host Updating base images
docker pull microsoft/nanoserver

Write-Host Updating Docker engine to master
Stop-Service docker
$wc = New-Object net.webclient
$wc.Downloadfile("https://master.dockerproject.org/windows/amd64/dockerd.exe", "$env:ProgramFiles\docker\dockerd.exe")
$wc.Downloadfile("https://master.dockerproject.org/windows/amd64/docker.exe", "$env:ProgramFiles\docker\docker.exe")
Start-Service docker
docker version

docker build -t whoami -f Dockerfile.windows .

docker images
