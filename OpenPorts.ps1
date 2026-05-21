$ports = Get-NetTCPConnection -State Listen

$result = foreach ($p in $ports) {
    $proc = Get-Process -Id $p.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        Address = $p.LocalAddress
        Port    = $p.LocalPort
        State   = $p.State
        Process = $proc.ProcessName
    }
}

$result | Format-Table -AutoSize