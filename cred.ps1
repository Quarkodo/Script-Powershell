$username = Get-Content c:\listeusername.txt;

for($i=0;$i -lt $a.Length;$i++){

$password = Get-Content c:\listepassword.txt;
$secureStringPwd = $password[$i] | ConvertTo-SecureString -AsPlainText -Force
    for($e=0;$e -lt $password.Length;$e++){
    write $username[$i] $secureStringPwd[$e]
    }
}