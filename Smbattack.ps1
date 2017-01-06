$port = 445

$net = “10.94.71”

$range = 1..254

$username = "sh"
$password = "shsh"
$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force 
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd


foreach ($r in $range)

{

 $ip = “{0}.{1}” -F $net,$r

 if(Test-Connection -BufferSize 32 -Count 1 -Quiet -ComputerName $ip)

   {

     $socket = new-object System.Net.Sockets.TcpClient($ip, $port)

     If($socket.Connected)

       {

        “$ip listening to port $port”
        New-PSDrive -name "K" -PSProvider FileSystem -Root "\\$ip\Share" -Persist -Credential $creds
        New-Item -Path "\\$ip\Share"  -ItemType file -Name nicePics.jpg -Value "We've got it"
        Copy-Item -Path "C:\Users\gerard\Downloads\chou.jpeg" -Destination "\\$ip\Share"   
        $socket.Close() }
     Else
        {
        $msg = "Port $port on $ip is closed, "                                 
        }
    Write-Host $msg

         }

 }