# quick and dirty script to run command as another user
# add "-authentication credssp" to invoke-command to resolve double hop problem

$computer = ''
$user = ''
$password = ''

$command = { whoami }

$secpass = convertto-securestring $password -asplaintext -force
$cred = new-object system.management.automation.pscredential($user, $secpass)

invoke-command -computer $computer -scriptblock $command -credential $cred
