# aws-powershell
Some scripts that use the AWS Tools for Powershell https://aws.amazon.com/powershell/

Example lines:
```powershell
Write-Host (Start-EC2Instance -instanceid $instanceid -Region $region).InstanceId

Write-Host -NoNewline "Waiting for instance to start..."
While((Get-EC2Instance -InstanceId $InstanceID -Region $Region).Instances[0].State.Name -ne 'running'){
    Write-Host -NoNewline "."
    Start-Sleep -s 3
}
```

Setup an SSH tunnel:

```powershell
$cur_amz_host = (Get-EC2Instance -InstanceId $InstanceID -Region $Region).Instances[0].PublicDnsName
Write-Host $cur_amz_host

# ssh with SOCKS, compress data, no interaction
$argumentlist = "-i $sshKeyPair_path -D 31337 -C -N $username@$cur_amz_host"
Start-Process -FilePath "ssh.exe" -ArgumentList $argumentlist
```

