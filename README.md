# Failure-Authentication-EventID4625

# OBJETIVO: #

- BUSCAR LOG DE FALHA DE AUTENTICAÇÃO NO WINDOWS 

# Como executar
Buscar todas as falha de autenticação com ID 4625

.\failed.ps1 -BUSCA TUDO

Buscando falha de autenticação que partiram do IP informado

.\failed.ps1 -IP 127.0.0.1

Buscando falhas de autenticação pelo nome do host

.\failed.ps1 -COMPUTERNAME felipe-A520M-DS3H

![Captura de tela de 2022-04-15 01-31-25](https://user-images.githubusercontent.com/24979677/163518835-c10eef36-2ddb-4106-a1cc-15951c6912d3.png)

# Observação  
Script foi testado somente no Windows Server 2012 R2 Datacenter  

Ideias e melhorias são bem vindas

A base do script foi retirada do site: http://woshub.com/rdp-connection-logs-forensics-windows/

