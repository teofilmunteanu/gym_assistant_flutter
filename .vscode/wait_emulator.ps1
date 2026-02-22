# Launch the emulator (idempotent) and wait for an Android emulator device to appear
flutter emulators --launch Medium_Phone_API_35
$timeout = 120
$elapsed = 0
while ($elapsed -lt $timeout) {
    $out = flutter devices 2>$null
    if ($out -match 'emulator') {
        Write-Output 'emulator ready'
        exit 0
    }
    Start-Sleep -Seconds 1
    $elapsed++
}
Write-Error 'Emulator did not appear in time'
exit 1
