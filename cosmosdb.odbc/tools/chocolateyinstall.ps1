$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://download.microsoft.com/download/4/f/7/4f7ec4ba-8521-440b-8fd3-42062ae7450d/azure-cosmos-odbc-2.0.6.1005-x64.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'cosmosdb odbc driver *'

  checksum64 = '2794d406d6a01b8bc6e435ce27a2660f02d8a9125b7ea4c3284b0391bbd6d931'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs