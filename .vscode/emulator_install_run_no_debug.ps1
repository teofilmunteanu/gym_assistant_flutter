# Launch emulator, wait for it, then run the Flutter app in release (no-debug) mode
Set-Location -Path $PSScriptRoot\..\
.\ .vscode\wait_emulator.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
flutter run --release
