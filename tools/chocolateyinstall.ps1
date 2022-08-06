$ErrorActionPreference = 'Stop'

$npmPackageName = 'green-tunnel'
$npmPackageVersion = '1.8.3'

if (-Not (Get-Command -Name 'npm' -CommandType Application -ErrorAction SilentlyContinue))
{
  Write-Output 'Cannot find npm - updating environment in case of a recent Node.js install...'
  Update-SessionEnvironment

  if (-Not (Get-Command -Name 'npm' -CommandType Application -ErrorAction SilentlyContinue))
  {
    Write-Warning 'npm package manager is either not installed or available on PATH. Package installation may fail.'
  }
  else
  {
    Write-Output 'npm should now be available, proceeding with install...'
  }
}

Write-Output "Installing $npmPackageName v$npmPackageVersion via npm..."
Install-NpmPackage -Package "$npmPackageName@$npmPackageVersion"

if (-Not (Get-Command -Name @('gt', 'green-tunnel') -CommandType ExternalScript -ErrorAction SilentlyContinue))
{
  Write-Warning 'Cannot find newly installed commands. Your shell may need to be reopened or refreshed before using.'
}
