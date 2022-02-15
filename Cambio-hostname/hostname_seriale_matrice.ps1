# è necessario fornire le credenziali di un utente (USER & PASS) in dominio con privilegi.
# modificare il codice del dip secondo esigenza

#---Configurazione---
$dip= 'YYYY'
$Username = "USER"
$Password = "PASS" | ConvertTo-SecureString -AsPlainText -Force

#---Main---

$ServiceTAG = $dip + '-' + $((Get-WmiObject Win32_BIOS).serialnumber)
$Creds = New-Object System.Management.Automation.PSCredential($Username ,$Password)

Rename-Computer -NewName $ServiceTAG -DomainCredential $Creds -Force
Restart-Computer -Force