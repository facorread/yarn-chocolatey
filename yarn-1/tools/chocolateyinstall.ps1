$PackageVersion = "1.22.22"

$Global:ErrorActionPreference = 'Stop'
$Global:InformationPreference = 'Continue'
$Global:VerbosePreference     = 'Continue'

$packageArgs = @{
  packageName = 'yarn'
  softwareName = 'Yarn*'
  fileType = 'msi'
  silentArgs = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  checksumType = 'sha512'
  url = "https://yarnpkg.com/downloads/$($PackageVersion)/yarn-$($PackageVersion).msi"
  checksum = 'A5057FC336F0ABB98CAA07EBE28CDC5CC880AF2F6CEAE2A91E368C52A689F2A60DDC2864B8FA815C0D5E80B7DF9308D9F186E1AA0769626F5318C38AF8AF4734'
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
