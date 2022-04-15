# Failure-Authentication-EventID4625

# OBJETIVO: #

- BUSCAR LOG DE FALHA DE AUTENTICAÇÃO NO WINDOWS 

# Como executar
.\dhcp.ps1 -IP 192.168.112.200

Sendo que o 192.168.112.200 é o IP que voce quer buscar, voce pode buscar por um IP, range ou pelo nome da máquina:

- Buscando pelo IP 192.168.112.200

.\dhcp.ps1 -IP 192.168.112.200

- Buscando pela máquina USUARIO01

.\dhcp.ps1 -IP USUARIO01

- Buscando pelo range 192.168.112.0/24

.\dhcp.ps1 -IP 192.168.112



# Observação  
Script foi testado somente no Windows Server 2012 R2 Datacenter  

Ideias e melhorias são bem vindas
