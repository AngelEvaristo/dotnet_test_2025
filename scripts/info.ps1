Write-Host "[info] Environment and git metadata"
& dotnet --info

$branch = if ($env:BRANCH_NAME) { $env:BRANCH_NAME } else { 'local' }
Write-Host "Branch: $branch"

try { git log -1 --pretty=oneline } catch { }
try { git rev-parse --short HEAD } catch { }
