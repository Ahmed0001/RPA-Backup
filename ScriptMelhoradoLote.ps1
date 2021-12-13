$objects = ('AVO.REGEX','Utility - Chrome')
$process = ('05121_Geracao_Kit_Desligamento_RH','Test Microsoft Excel VBO - Extended')
$release = "POC_ConsultaCEP"

mkdir ('.\Process')
mkdir ('.\Object')

#Export Process
set-location ".\Process"

    foreach ($processt in $process)
    {
        & "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.Exe" /user admin KJKSZPJe@1 /dbconname  'LocalDB Connection' /export $processt
    
    }

#Export Object
set-location "..\Object"
    foreach ($object in $objects)
    {
         & "C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.Exe" /user admin KJKSZPJe@1 /dbconname  'LocalDB Connection' /export $object
    }

#Export Release
set-location "C:\git\RPA-Backup\Release"
 
""""+"C:\Program Files\Blue Prism Limited\Blue Prism Automate\AutomateC.Exe"+""""+" /user admin KJKSZPJe@1 /dbconname "+""""+"LocalDB Connection"+""""+" /exportpackage "+""""+ $release+"""">ExportRelease.bat

Set-Location 'C:\git\RPA-Backup'

#Git
git add .
#$data = "'Realizado: "+ [datetime]::Now + "'"
git commit -m $data  
# PRIMEIRA VEZ É EXECUTADO ESSE  ----- > git push --set-upstream origin Staging 
git push -u

#Clear-Host