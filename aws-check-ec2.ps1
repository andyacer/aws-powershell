
# Get ec2 instance status

param(
[switch] $nopause)

Write-Host ""
Write-Host "Checking AWS EC2 status ..."

$instanceid = "i-12034asdf81234"
$region = "us-east-1"

$result = (Get-EC2Instance -InstanceId $InstanceID -Region $Region).Instances[0].State.Name

Write-Host $instanceid
Write-Host ""
Write-Host "-------------------------------------"
write-host ""
Write-Host $result
Write-Host ""
Write-Host "-------------------------------------"
Write-Host ""
if(!$nopause){ pause } 
