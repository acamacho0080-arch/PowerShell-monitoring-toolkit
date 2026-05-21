$ReportPath = "$env:USERPROFILE\OneDrive\Desktop\FailedLogins.csv"
$Threshold = 5

# Get today's date
$Today = (Get-Date).Date

# Pull failed logins from today
$Events = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4625
    StartTime = $Today
}

# Select useful fields
$Filtered = $Events | Select-Object TimeCreated, Id, Message

# Export to CSV
$Filtered | Export-Csv $ReportPath -NoTypeInformation

# Count events
$Count = $Filtered.Count

Write-Output "Failed login attempts today: $Count"
Write-Output "Report saved to $ReportPath"

# Alert if threshold exceeded
if ($Count -gt $Threshold) {
    Write-Output "⚠️ ALERT: High number of failed login attempts!"
}