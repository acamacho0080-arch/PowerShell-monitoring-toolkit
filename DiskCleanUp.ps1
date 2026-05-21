$temp = "$env:TEMP\*"

Remove-Item $temp -Recurse -Force -ErrorAction SilentlyContinue

Write-Output "Temporary files cleaned!"