Get-WinEvent -LogName System -MaxEvents 100 |
Where-Object { $_.LevelDisplayName -eq "Error" } |
Select-Object TimeCreated, Id, ProviderName, Message