Write-Host "[build] Building solution in Release"
& dotnet build MyMinimalApi.sln --configuration Release --no-restore
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
