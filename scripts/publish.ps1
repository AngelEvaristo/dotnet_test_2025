Write-Host "[publish] Publishing API"
New-Item -ItemType Directory -Path artifacts -ErrorAction SilentlyContinue | Out-Null
& dotnet publish MyMinimalApi/MyMinimalApi.csproj `
  --configuration Release `
  --no-build `
  --output ./artifacts/publish
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
