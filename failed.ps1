param ($IP,$COMPUTERNAME,$BUSCA)
if ($IP -like "*.*.*.*")
{
write-host "Realizando a busca do IP: $IP"
Get-EventLog -LogName Security | ?{(4625) -contains $_.EventID }| %{
(new-object -Type PSObject -Property @{
TimeGenerated = $_.TimeGenerated
ClientIP = $_.Message -replace '(?smi).*Source Network Address:\s+([^\s]+)\s+.*','$1'
UserName = $_.Message -replace '(?smi).*\s\sAccount Name:\s+([^\s]+)\s+.*','$1'
UserDomain = $_.Message -replace '(?smi).*\s\sAccount Domain:\s+([^\s]+)\s+.*','$1'
LogonType = $_.Message -replace '(?smi).*Logon Type:\s+([^\s]+)\s+.*','$1'
WorkstationName = $_.Message -replace '(?smi).*\s\sWorkstation Name::*\s+([^\s]+)\s+.*','$1' 
})
} | sort TimeGenerated -Descending | Where-Object { $_.ClientIP -like "$IP" } | Format-Table -Property TimeGenerated,ClientIP,UserDomain,UserName,WorkstationName,LogonType -AutoSize
}
elseif ($COMPUTERNAME -like '*?*')
{
write-host "Realizando a busca pela workstation: $COMPUTERNAME"
Get-EventLog -LogName Security | ?{(4625) -contains $_.EventID }| %{
(new-object -Type PSObject -Property @{
TimeGenerated = $_.TimeGenerated
ClientIP = $_.Message -replace '(?smi).*Source Network Address:\s+([^\s]+)\s+.*','$1'
UserName = $_.Message -replace '(?smi).*\s\sAccount Name:\s+([^\s]+)\s+.*','$1'
UserDomain = $_.Message -replace '(?smi).*\s\sAccount Domain:\s+([^\s]+)\s+.*','$1'
LogonType = $_.Message -replace '(?smi).*Logon Type:\s+([^\s]+)\s+.*','$1'
WorkstationName = $_.Message -replace '(?smi).*\s\sWorkstation Name::*\s+([^\s]+)\s+.*','$1' 
})
} | sort TimeGenerated -Descending | Where-Object { $_.WorkstationName -like "$COMPUTERNAME" } | Format-Table -Property TimeGenerated,ClientIP,UserDomain,UserName,WorkstationName,LogonType -AutoSize
}
elseif ($BUSCA -match 'TUDO')
{
write-host "Realizando a busca por todos os logs de falha de autenticação"
Get-EventLog -LogName Security | ?{(4625) -contains $_.EventID }| %{
(new-object -Type PSObject -Property @{
TimeGenerated = $_.TimeGenerated
ClientIP = $_.Message -replace '(?smi).*Source Network Address:\s+([^\s]+)\s+.*','$1'
UserName = $_.Message -replace '(?smi).*\s\sAccount Name:\s+([^\s]+)\s+.*','$1'
UserDomain = $_.Message -replace '(?smi).*\s\sAccount Domain:\s+([^\s]+)\s+.*','$1'
LogonType = $_.Message -replace '(?smi).*Logon Type:\s+([^\s]+)\s+.*','$1'
WorkstationName = $_.Message -replace '(?smi).*\s\sWorkstation Name::*\s+([^\s]+)\s+.*','$1' 
})
} | sort TimeGenerated -Descending | Format-Table -Property TimeGenerated,ClientIP,UserDomain,UserName,WorkstationName,LogonType -AutoSize
}
else 
{
write-host "VOCE PODE FAZER A BUSCA DE TRES FORMAS"
write-host "BUSCANDO PELO IP: .\rdp2.ps1 -IP 127.0.0.1"
write-host "BUSCANDO PELO NOME DA MÁQUINA QUE TENTOU AUTENTICAR: .\rdp2.ps1 -COMPUTERNAME felipe-A520M-DS3H"
write-host "BUSCANDO POR TUDO: .\rdp2.ps1 -BUSCA TUDO"
}
