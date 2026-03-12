Write-Host "[restore] Restoring NuGet packages"
& dotnet restore MyMinimalApi.sln
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
