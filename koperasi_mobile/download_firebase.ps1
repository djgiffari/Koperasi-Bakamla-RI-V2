$url = "https://dl.google.com/firebase/sdk/cpp/firebase_cpp_sdk_windows_13.5.0.zip"
$outPath = "C:\Users\Giffari\Pictures\Koperasi v3\koperasi_mobile\windows\firebase_cpp_sdk.zip"
$extractPath = "C:\Users\Giffari\Pictures\Koperasi v3\koperasi_mobile\windows\firebase_cpp_sdk"

if (Test-Path $outPath) { Remove-Item -Force $outPath }

Write-Host "Downloading via BITS (Resilient Transfer)..."
Import-Module BitsTransfer

Start-BitsTransfer -Source $url -Destination $outPath

if (Test-Path $outPath) {
    Write-Host "Download complete! Extracting ZIP file..."
    if (Test-Path $extractPath) { Remove-Item -Recurse -Force $extractPath }
    Expand-Archive -Path $outPath -DestinationPath $extractPath -Force
    Write-Host "Extraction complete!"
} else {
    Write-Host "Failed to download."
    exit 1
}
