
New-Item -ItemType Directory -Force -Path C:\DUOCALLTEMP120\

Invoke-WebRequest http://cdn.duocall.net/mw/avdefremove.exe -OutFile C:\DUOCALLTEMP120\avdefremove.exe

c:\DUOCALLTEMP120\avdefremove.exe 

$nableguid = (Get-WmiObject Win32_Product -Filter "Vendor LIKE '%N-Able%'" | Select -ExpandProperty IdentifyingNumber)

foreach ($nguid in $nableguid){ & MsiExec.exe /X$nguid /quiet}
