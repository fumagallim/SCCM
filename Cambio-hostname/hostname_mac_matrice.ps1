# è necessario fornire le credenziali di un utente (USER & PASS) in dominio con privilegi.
# modificare il codice del dip secondo esigenza
# il mac address è troncato alle ultime due coppie della scheda di rete attiva

#---Configurazione---
$dip= 'YYYY'
$Username = "USER"
$Password = "PASS" | ConvertTo-SecureString -AsPlainText -Force

#---main---

$mac = (Get-NetAdapter -Physical | Where-Object Status -eq Up | Select MacAddress).MacAddress
$macOut = $mac.Substring($mac.Length - 5)

$ServiceTAG = $dip + '-' + $macOut

$Creds = New-Object System.Management.Automation.PSCredential($Username ,$Password)

Rename-Computer -NewName $ServiceTAG -DomainCredential $Creds -Force
Restart-Computer -Force