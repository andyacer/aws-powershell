
# Startup ec2 instance

param(
[switch] $nopause)


Write-Host ""
Write-Host "Starting AWS EC2 instance ..."
$instanceid = "i-12034asdf81234"
$region = "us-east-1"

Write-Host (Start-EC2Instance -instanceid $instanceid -Region $region).InstanceId

Write-Host "-------------------------------------"
Write-Host ""
Write-Host -NoNewline "Waiting for instance to start..."


While((Get-EC2Instance -InstanceId $InstanceID -Region $Region).Instances[0].State.Name -ne 'running'){
    Write-Host -NoNewline "."
    Start-Sleep -s 3
}

write-host ""
Write-Host "Done."
Write-Host ""
Write-Host "-------------------------------------"
Write-Host ""
if(!$nopause){ pause } 


