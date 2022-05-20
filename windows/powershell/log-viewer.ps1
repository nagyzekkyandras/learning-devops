# tail -f for Windows

# ISSUE: "cannot be loaded because the execution of scripts is disabled on this system."
# FIX: run as admin this command
# Set-ExecutionPolicy RemoteSigned

$ma = Get-Date -Format "yyyy-MM-dd"
$path = "C:\App\apache-tomcat\logs"

Get-Content $path\catalina.$ma.log –Wait
