$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName = 'yarn'
  softwareName = 'Yarn*'
  fileType = 'msi'
  silentArgs = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  checksumType = 'sha512'
  url = 'https://yarnpkg.com/downloads/1.22.19/yarn-1.22.19.msi'
  checksum = '514781fd185845bf9816f57061bd9609254c6bfc20e642db621b592109af7fb4401a36e134ad253ea9d533170560223856655029e95ded7f5576ed62d47d6a53'
}

Install-ChocolateyPackage @packageArgs

# Update Yarn's package.json file so it can tell that it was installed via Chocolatey.
if (Test-Path "${env:ProgramFiles(x86)}\Yarn\package.json") {
  $path = "${env:ProgramFiles(x86)}\Yarn\package.json"
} else {
  $path = "$env:ProgramFiles\Yarn\package.json"
}

$script = @"
  (Get-Content -Path '$path') ``
    -replace 'installationMethod":.+', 'installationMethod": "choco",' ``
    | Set-Content '$path'
"@

Start-ChocolateyProcessAsAdmin -Statements $script

if (-Not (Get-Command "node" -errorAction SilentlyContinue)) {
  Write-Host "Yarn requires NodeJS to be installed. To install, use either of the commands below:"
  Write-Host "choco install nodejs"
  Write-Host "choco install nodejs-lts"
}
