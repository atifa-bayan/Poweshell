<#
Fuehre das Script aus und finde heraus welche Variable welchen Typ hat.
#>

$Var1 = "Scripting mit Powershell"
#$Var1 Typ ist string
$Var2 = "123"
# $Var2 Typ ist string
$Var3 = 123
$Var3.GetType()
#$var3 typ ist int
$Var4 = "ÜBUNG1","ÜBUNG2","ÜBUNG3","ÜBUNG4"
#$var4 typ ist array
$Var5 = 1 -eq 2
$Var5.GetType()
#$var5 typ ist boolean
$Var6 = @{
    Name = "GBSSG"
    Modul = "Scripting mit PowerShell"}
$Var6.GetType()
#$Var6 typ ist Hashtable
$Var7 = Get-Date
$Var7.GetType()
#$Var7 typ ist DateTime
