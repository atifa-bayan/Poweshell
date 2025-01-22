<#
a: - Schreibe alle Dateinamen und ihre Dateigrösse des Verzeichnisses C:\Windows\System32 in ein Array
b: - Erstelle ein neues Array mit allen Files die grösser als 3MB sind. Speichere nur Dateinamen und Dateigrösse
c: - Loope durch alle laufenden Prozesse und beende die Schlaufe beim ersten Prozess der im Namen mit einem O beginnt. 
            Gebe den Namen des Prozesses und Anzahl Durchgänge auf der Konsole aus.
#>
# Part A: Get all file names and their file sizes in C:\Windows\System32
$allFiles = Get-ChildItem -Path "C:\Windows\System32" -File | 
            Select-Object Name, @{Name="Size(MB)"; Expression={[math]::Round($_.Length / 1MB, 2)}}

# Part B: Filter files larger than 3MB
$largeFiles = $allFiles | Where-Object { $_.'Size(MB)' -gt 3 }

# Output the files larger than 3MB
Write-Output "Files larger than 3MB:"
$largeFiles

# Part C: Loop through all running processes
$processes = Get-Process
$passCount = 0

foreach ($process in $processes) {
    $passCount++
    if ($process.Name -like "O*") {
        Write-Output "First process starting with 'O': $($process.Name)"
        Write-Output "Number of passes: $passCount"
        break
    }
}

