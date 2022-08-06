$ErrorActionPreference = 'Stop'

if (-Not (Get-Command -Name 'npm' -CommandType Application -ErrorAction SilentlyContinue))
{
  Write-Output 'Cannot find npm - updating environment in case of a recent Node.js install...'
  Update-SessionEnvironment

  if (-Not (Get-Command -Name 'npm' -CommandType Application -ErrorAction SilentlyContinue))
  {
    Write-Warning 'npm package manager is either not installed or available on PATH. Package uninstallation may fail.'
  }
  else
  {
    Write-Output 'npm should now be available, proceeding with uninstall...'
  }
}

Uninstall-NpmPackage -Package 'green-tunnel'
