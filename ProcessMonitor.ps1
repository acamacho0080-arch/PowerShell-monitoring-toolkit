while ($true) {
    Clear-Host

    Write-Host "===== TOP CPU PROCESSES =====" -ForegroundColor Cyan
    Get-Process | Sort-Object CPU -Descending |
    Select-Object -First 10 Name, CPU, Id

    Write-Host ""
    Write-Host "===== TOP MEMORY PROCESSES =====" -ForegroundColor Yellow
    Get-Process | Sort-Object WorkingSet -Descending |
    Select-Object -First 10 Name,
        @{Name="Memory(MB)";Expression={[math]::Round($_.WorkingSet / 1MB, 2)}},
        Id

    Start-Sleep -Seconds 3
}