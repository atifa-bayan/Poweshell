<#
Übung 6a: - Schreibe eine Funktion die ein Logfile in deinem Übungsverzeichnis schreibt.
            Als Parameter soll die Lognachricht, der Nachrichttyp(Info oder Error) mitgegeben werden.
            Die Lognachricht soll folgendes Format haben: 22.08.2023 07:16 - Info - Das ist die Lognachricht
Übung 6b: - Schreibe die Dateiennamen eures %TEMP% Verzeichnisses mit Hilfe der Funktion in das Logfile.
#>
# Define the log function
function Write-Log {
    param (
        [string]$LogMessage,
        [ValidateSet("Info", "Error")]
        [string]$MessageType
    )
    # Get the script directory
    $scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
    $logFilePath = Join-Path -Path $scriptDirectory -ChildPath "ExerciseLog.log"

    # Format the log entry
    $timestamp = Get-Date -Format "MM/dd/yyyy HH:mm"
    $logEntry = "$timestamp - $MessageType - $LogMessage"

    # Append the log entry to the log file
    Add-Content -Path $logFilePath -Value $logEntry
}

# Exercise 6b: Write file names from %TEMP% into the log file
$tempDirectory = [System.IO.Path]::GetTempPath() # Get the %TEMP% directory path
$tempFiles = Get-ChildItem -Path $tempDirectory -File # Get the files in %TEMP%

foreach ($file in $tempFiles) {
    # Use the Write-Log function to log each file name
    Write-Log -LogMessage "File found: $($file.Name)" -MessageType "Info"
}

Write-Output "Log file updated with file names from $tempDirectory."
