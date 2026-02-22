# Launch emulator, wait for it, then run the Flutter app
Set-Location -Path $PSScriptRoot\..\
.\ .vscode\wait_emulator.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
flutter run
