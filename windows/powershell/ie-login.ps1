$username = "felhasználónév" 
$password = "jelszó" 
$url="webcím"

$ie = New-Object -com InternetExplorer.Application 
$ie.visible=$true
$ie.navigate($url)

while($ie.ReadyState -ne 4){
	start-sleep -m 100
}

$ie.document.getElementById("USERID").value= "$username"
$ie.document.getElementById("USERPASSWORD").value = "$password"
#1 ID esetén
$ie.document.getElementById("signIn").click()
#2 ha nincs id de van class
$Click=$ie.Document.getElementsByTagName("button") | Where-Object {$_.type -eq 'submit'}
$Click.click();