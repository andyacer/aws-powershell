
# Setup SSH tunnel with SOCKS support to EC2 host

$instanceid = "i-12034asdf81234"
$region = "us-east-1"
$sshKeyPair_path = "C:\path\to\keypair.txt"
$username = "ec2-user"

$startupScript = ".\aws-start-ec2.ps1"

& $startupScript -nopause

$cur_amz_host = (Get-EC2Instance -InstanceId $InstanceID -Region $Region).Instances[0].PublicDnsName
Write-Host $cur_amz_host

# ssh with SOCKS, compress data, no interaction
$argumentlist = "-i $sshKeyPair_path -D 31337 -C -N $username@$cur_amz_host"
$command = "ssh $argumentlist"

Write-Host ""
Write-Host "Running the following command:"
Write-Host "$command"
Write-Host "-------------------------------------"
Write-Host ""

Start-Process -FilePath "ssh.exe" -ArgumentList $argumentlist

pause

