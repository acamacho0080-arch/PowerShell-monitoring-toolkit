$cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$ram = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue

Write-Output "CPU Usage: $([math]::Round($cpu,2))%"
Write-Output "Available RAM: $ram MB"

if ($cpu -gt 80) {
    Write-Output "⚠️ High CPU usage detected!"
}