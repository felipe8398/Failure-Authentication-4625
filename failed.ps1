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