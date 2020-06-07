# set-configs.ps1
# 
# MAINTAINER: Max Prehl
# UPDATED: Jun. 7, 2020
#
# This script should take each of the Windows based config 
# files for application configurations and copy them into
# the appropriate locations on the Windows system.
#
# Run from powershell using the ExecutionPolicy Bypass:
# `Set-ExecutionPolicy Bypass -Scope Process -Force; WindowsConfigs\set-configs.ps1`
#
# try running this from bash using:
#
# `powershell.exe "Set-ExecutionPolicy Bypass -Scope Process -Force; WindowsConfigs\set-configs.ps1"`

Write-Output "Get-Location"
Get-Location | Where-Object Path

# Write-Output "Get-ChildItem $HOME"
# Get-ChildItem $HOME

$configs = New-Object System.Collections.ArrayList

$temp = [PSCustomObject]@{
    Name        = "Windows Terminal Settings"
    SystemPath  = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    RepoPath    = "WindowsConfigs\Terminal\settings.json"
}
$configs.Add($temp)

$temp = [PSCustomObject]@{
    Name        = "Sumatra Settings"
    SystemPath  = "$HOME\AppData\Roaming\SumatraPDF\SumatraPDF-settings.txt"
    RepoPath    = "WindowsConfigs\Sumatra\SumatraPDF-settings.txt"
}
$configs.Add($temp)

$temp = "" | select "Name", "SystemPath", "RepoPath"
$temp.Name          = "Ubuntu Logo for Windows Terminal"
$temp.SystemPath    = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState\cof_orange_hex.png"
$temp.RepoPath      = "WindowsConfigs\Terminal\cof_orange_hex.png"
$configs.Add($temp)

$temp = "" | select "Name", "SystemPath", "RepoPath"
$temp.Name          = "Debian Logo for Windows Terminal"
$temp.SystemPath    = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState\debian-openlogo-nd-100.png"
$temp.RepoPath      = "WindowsConfigs\Terminal\debian-openlogo-nd-100.png"
$configs.Add($temp)

$temp = "" | select "Name", "SystemPath", "RepoPath"
$temp.Name          = "Powershell Profile"
$temp.SystemPath    = "$HOME\.profile"
$temp.RepoPath      = "WindowsConfigs\.profile"
$configs.Add($temp)

$temp = "" | select "Name", "SystemPath", "RepoPath"
$temp.Name          = "SSH Config"
$temp.SystemPath    = "$HOME\.ssh\config"
$temp.RepoPath      = ".ssh\config"
$configs.Add($temp)

Write-Output $configs

$configs | ForEach-Object {
    # $_.Name;
    # $_.SystemPath;
    # Test-Path $_.SystemPath;
    if (Test-Path $_.SystemPath) {
        Copy-Item -Path $_.SystemPath -Destination "WindowsConfigs\BackupDump\"
        if (Test-Path $_.RepoPath ) {
            Copy-Item -Confirm -Force -Path $_.RepoPath -Destination $_.SystemPath
        }
    } 
}

