# Failure-Authentication-EventID4625

# OBJETIVO: #

- BUSCAR LOG DE FALHA DE AUTENTICAÇÃO NO WINDOWS 

# Como executar
Buscar todas as falha de autenticação com ID 4625

.\rdp2.ps1 -BUSCA TUDO

Buscando falha de autenticação que partiram do IP informado

.\rdp2.ps1 -IP 127.0.0.1

Buscando falhas de autenticação pelo nome do host
.\rdp2.ps1 -COMPUTERNAME felipe-A520M-DS3H

# Observação  
Script foi testado somente no Windows Server 2012 R2 Datacenter  

Ideias e melhorias são bem vindas

A base do script foi retirada do site: http://woshub.com/rdp-connection-logs-forensics-windows/

