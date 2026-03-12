Write-Host "[test] Running unit tests with TRX output"
New-Item -ItemType Directory -Path TestResults -ErrorAction SilentlyContinue | Out-Null
& dotnet test MyMinimalApi.Tests/MyMinimalApi.Tests.csproj `
  --configuration Release `
  --no-build `
  --logger "trx;LogFileName=test-results.trx" `
  --results-directory ./TestResults
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
