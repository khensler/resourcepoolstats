$rp = get-resourcepool

$sStat = @{
    Entity = $rp
    Start = (Get-Date).AddHours(-12)
    Stat = 'mem.consumed.average','cpu.usagemhz.average'
}

Get-Stat @sStat | select  @{Name="Name";Expression = {(get-resourcepool -id $_.EntityID).Name}},@{Name="VMCount";Expression = {(get-resourcepool -id $_.EntityID).ExtensionData.VM.Count}} ,MetricID,Value,TimeStamp | export-csv stat.csv
