<#
a: - Überprüfe auf deinem Gerät ein Prozess mit dem Namen "OneNote" läuft und gebe die ID des Prozesses aus
b: - Wenn der Prozess nicht läuft, gebe einen folgenden String aus "Prozess OneNote läuft nicht."
c: - Überprüfe ob in deinem Scriptverzeichnis die Datei "Scriptlog.log" existiert. Falls nicht erstelle die Datei mit dem Inhalt "Script gestartet"
#>
$process = Get-Process -Name "OneNote" -ErrorAction SilentlyContinue

if ($process) {
    Write-Output "OneNote process is running with ID: $($process.Id)"
} else {
    Write-Output "Process OneNote is not running."
}

# Get the directory of the current script
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$logFilePath = Join-Path -Path $scriptDirectory -ChildPath "Scriptlog.log"
# Check if the file exists
if (-Not (Test-Path $logFilePath)) {
    # Create the file with the content "Script started"
    "Script started" | Set-Content -Path $logFilePath
    Write-Output "Log file created at $logFilePath"
} else {
    Write-Output "Log file already exists at $logFilePath"
}