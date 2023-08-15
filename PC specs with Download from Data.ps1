<# 
  Author: Nicolas Möller, Cedric Bühler
  .SYNOPSIS 
  Mit Menüauswahl Informationen holen   
  .DESCRIPTION 
  Mit dem Skript kann man Informationen mit einer Menüauswahl von einem PC erhalten.
  Es gibt 5 Punkte zur Auswahl und zu jedem kann man auch auswählen ob man eine .csv oder HTML haben will.   
  .EXAMPLE 
  \Projekt_BUC_MON.ps1   
  .NOTES 
  Wenn man im Menü der Falsche Buchstaben oder Zahl angibt, ist dieser Ungültig
  Protokoll:
  Datum        Name            Beschreibung
  22.03.2023    Nicolas Möller    Skript Vollendet  
#>  



#Funktionsbibliothek
<#Funktion Get-Error bekommt man die System Errors 
 Nach der Anzeige des Logs kommt eine Auswahl ob man diese Exportieren will oder zum Menü zurück will.#>
function Get-Error 
{
#Erst Anzeige
Write-Host "================ System Error Info ================"
   $Fehler = Get-EventLog -entrytype Error -After (Get-Date).AddDays(-7) -LogName System
   Write-Output $Fehler
    # Export oder Leave anfrage
    Write-Host "================ Export? =================="
    Write-Host "1: Wähle '1' Export als CSV"
    Write-Host "2: Wähle '2' Export als Html"
    Write-Host "3: Wähle 'Beliebige Taste' Zurück zum Menü"

    $fehlerauswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
    switch ($fehlerauswahl){
     '1' {#CSV
            Get-EventLog -entrytype Error -After (Get-Date).AddDays(-7) -LogName System|Export-Csv -Path $env:USERPROFILE\fehlerinfo.csv -UseCulture 

          Clear-Host

          Write-Host "Die Datei ist im Userordner"

          Start-Sleep -Seconds 2

          Show-Mainmenu
     
         }
     '2' {
            #Html Infos
            Get-EventLog -entrytype Error -After (Get-Date).AddDays(-7) -LogName System | ConvertTo-html -Body "<H2> Eventlog Error Information</H2>" >>  ".\fehlerinfo.html"
            invoke-Expression ".\fehlerinfo.html"
            
            Clear-Host

            Write-Host "Eventlog info wird angezeigt!"

            Start-Sleep -Seconds 2

            Show-Mainmenu
          }
     '3' {Show-Mainmenu}
     default {Show-Mainmenu}
     #End
    }
}
<#Funktion Get-Error bekommt man die Application Errors 
 Nach der Anzeige des Logs kommt eine Auswahl ob man diese Exportieren will oder zum Menü zurück will.#>
function Get-Error2 
{
#Erst Anzeige
Write-Host "================ Application Error Info ================"
   $Fehler2 = Get-EventLog -entrytype Error -After (Get-Date).AddDays(-7) -LogName Application
   Write-Output $Fehler2
    # Export oder Leave anfrage
    Write-Host "================ Export? =================="
    Write-Host "1: Wähle '1' Export als CSV"
    Write-Host "2: Wähle '2' Export als Html"
    Write-Host "3: Wähle 'Beliebige Taste' Zurück zum Menü"

    $fehler2auswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
    switch ($fehler2auswahl){
     '1' {#CSV
            Get-EventLog -entrytype Error -After (Get-Date).AddDays(-7) -LogName Application|Export-Csv -Path $env:USERPROFILE\fehlerAPPinfo.csv -UseCulture 

          Clear-Host

          Write-Host "Die Datei ist im Userordner"

          Start-Sleep -Seconds 2

          Show-Mainmenu
     
         }
     '2' {
            #Html Infos
            Get-EventLog -entrytype Error -After (Get-Date).AddDays(-7) -LogName Application | ConvertTo-html -Body "<H2> Eventlog Error Information</H2>" >>  ".\fehlerAPPinfo.html"
            invoke-Expression ".\fehlerAPPinfo.html"
            
            Clear-Host

            Write-Host "Eventlog info wird angezeigt!"

            Start-Sleep -Seconds 2

            Show-Mainmenu
          }
     '3' {Show-Mainmenu}
     default {Show-Mainmenu}
     #End
    }
}
<#Funktion Get-Bios zeigt alles Bios infos an
Nach der Anzeige des Logs kommt eine Auswahl ob man diese Exportieren will oder zum Menü zurück will .#>
 function Get-Bios {
 #Erst Anzeige
 Write-Host "================ Bios Info ================"
 $Bios = Get-CimInstance Win32_BIOS
 Write-Output $Bios
 # Export oder Leave anfrage
    Write-Host "================ Export? =================="
    Write-Host "1: Wähle '1' Export als CSV"
    Write-Host "2: Wähle '2' Export als Html"
    Write-Host "3: Wähle 'Beliebige Taste' Zurück zum Menü"
    
    $Biosauswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
    switch ($Biosauswahl){
     '1' {
          #CSV
          Get-CimInstance Win32_BIOS|Export-Csv -Path $env:USERPROFILE\Biosinfo.csv -UseCulture 

          Clear-Host

          Write-Host "Die Datei ist im Userordner"

          Start-Sleep -Seconds 2

          Show-Mainmenu
     
         }
     '2' {
            #Html Infos
            Get-WmiObject win32_bios | select Status,Version,PrimaryBIOS,Manufacturer,ReleaseDate,SerialNumber | ConvertTo-html -Body "<H2> BIOS Information</H2>" >>  ".\biosinfo.html"
            invoke-Expression ".\biosinfo.html"
            
            Clear-Host

            Write-Host "Bios info wird angezeigt!"

            Start-Sleep -Seconds 2

            Show-Mainmenu
          }
     '3' {Show-Mainmenu}
     default {Show-Mainmenu}
    }
 }
 <#Funktion Get-CPINFO zeigt alles PC infos an
Nach der Anzeige des Logs kommt eine Auswahl ob man diese Exportieren will oder zum Menü zurück will .#>
 function Get-CPINFO {
 #Erst Anzeige
 Write-Host "================ Computer Info ================"
 $CPI = Get-ComputerInfo -Property OS*,Windows*
 Write-Output $CPI
 # Export oder Leave anfrage
 Write-Host "================ Export? ====================="
    Write-Host "1: Wähle '1' Export als CSV"
    Write-Host "2: Wähle '2' Export als Html"
    Write-Host "3: Wähle 'Beliebige Taste' Zurück zum Menü"
    
    $CPIauswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
    switch ($CPIauswahl){
     '1' {
          #CSV
          Get-ComputerInfo -Property OS*,Windows*|Export-Csv -Path $env:USERPROFILE\CPIinfo.csv -UseCulture 

          Clear-Host

          Write-Host "Die Datei ist im Userordner"

          Start-Sleep -Seconds 2

          Show-Mainmenu
     
         }
     '2' {
            #Html Infos
            Get-ComputerInfo -Property OS*,Windows* |  ConvertTo-html -Body "<H2> Computer info</H2>" >>  ".\CPIinfo.html"
            invoke-Expression ".\CPIinfo.html"
            
            Clear-Host

            Write-Host "Computer info wird angezeigt!"

            Start-Sleep -Seconds 2

            Show-Mainmenu
          }
     '3' {Show-Mainmenu}
     default {Show-Mainmenu}
    }
 }
 <#Funktion Get-Driveinfo zeigt denn leeren Festplattenspeicher an
Nach der Anzeige des Logs kommt eine Auswahl ob man diese Exportieren will oder zum Menü zurück will .#>
function Get-Driveinfo {
#Erst Anzeige
 Write-Host "================ Harddisk info ================"
 $Driveinfo = Get-PSDrive | Where {$_.Free}
 Write-Output $Driveinfo
 # Export oder Leave anfrage
 Write-Host "================ Export? ====================="
    Write-Host "1: Wähle '1' Export als CSV"
    Write-Host "2: Wähle '2' Export als Html"
    Write-Host "3: Wähle 'Beliebige Taste' Zurück zum Menü"
    $DRauswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
    switch ($DRauswahl){
     '1' {
          #CSV
          Get-PSDrive | Where {$_.Free}|Export-Csv -Path $env:USERPROFILE\Driveinfo.csv -UseCulture

          Clear-Host

          Write-Host "Die Datei ist im Userordner"

          Start-Sleep -Seconds 2

          Show-Mainmenu
     
         }
     '2' {
            #Html Infos
            Get-PSDrive | Where {$_.Free} |  ConvertTo-html -Body "<H2> Harddisk Info</H2>" >>  ".\Driveinfo.html"
            invoke-Expression ".\Driveinfo.html"
            
            Clear-Host

            Write-Host "Harddisk info wird angezeigt!"

            Start-Sleep -Seconds 2

            Show-Mainmenu
          }
     '3' {Show-Mainmenu}
     default {Show-Mainmenu}
    }
 }
 <#Funktion Get-Dienste zeigt alles Diesnte an un ob diese laufen oder gestoppt sind.
Nach der Anzeige des Logs kommt eine Auswahl ob man diese Exportieren will oder zum Menü zurück will .#>
 function Get-Dienste {
 #Erst Anzeige
  Write-Host "================ Dienste info ================"
 $DIN = Get-Service | Select-Object -Property Name, Status | Sort-Object -Property Status, Name 
 Write-Output $DIN
 # Export oder Leave anfrage
 Write-Host "================ Export? ====================="
    Write-Host "1: Wähle '1' Export als CSV"
    Write-Host "2: Wähle '2' Export als Html"
    Write-Host "3: Wähle 'Beliebige Taste' Zurück zum Menü"
    $DIauswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
    switch ($DIauswahl){
     '1' {
          #CSV
          Get-Service | Select-Object -Property Name, Status | Sort-Object -Property Status, Name |Export-Csv -Path $env:USERPROFILE\Diensteinfo.csv -UseCulture

          Clear-Host

          Write-Host "Die Datei ist im Userordner"

          Start-Sleep -Seconds 2

          Show-Mainmenu
     
         }
     '2' {
            #Html Infos
            Get-Service | Select-Object -Property Name, Status | 
            Sort-Object -Property Status, Name  |  ConvertTo-html -Body "<H2> Dienste Info</H2>" >>  ".\Diensteinfo.html"
            invoke-Expression ".\Diensteinfo.html"
            
            Clear-Host

            Write-Host "Dienste info wird angezeigt!"

            Start-Sleep -Seconds 2

            Show-Mainmenu
          }
     '3' {Show-Mainmenu}
     default {Show-Mainmenu}
    }
 }
 <#Funktion Show-Mainmenu ist das Hauptmenu und lässt die auswahl zwischen denn einzelnen Funktionen 
 um die Infos des Pc's abzugreifen.#>
function Show-Mainmenu
{
    param (
        [string]$menuname = 'PC Informationen Menü'
    )

    Clear-Host
    Write-Host "⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸ $menuname ⫷⫷⫷⫷⫷⫷⫷⫷⫷⫷"
    
    Write-Host "1: Wähle '1' für Bios Informationen"
    Write-Host "2: Wähle '2' Betriebsysteminformation"
    Write-Host "3: Wähle '3' Harddisk Informationen"
    Write-Host "4: Wähle '4' Errors aus dem Systemlog bis zur Letzten Woche"
    Write-Host "5: Wähle '5' Errors aus dem Applicationslog bis zur Letzten Woche"
    Write-Host "6: Wähle '6' Alle laufenden und gestoppten Windows Dienste"
    Write-Host "Q: Wähle 'q' um das Programm zu beenden."

    $auswahl = Read-Host "Bitte die gewünschte Option wählen"

# Optionen wählen
switch ($auswahl){
     '1' {Get-Bios}
     '2' {Get-CPINFO}
     '3' {Get-Driveinfo}
     '4' {Get-Error}
     '5' {Get-Error2}
     '6' {Get-Dienste}
     'q' {exit}
     default {Show-Mainmenu}
 }
}

# Main
Show-Mainmenu
