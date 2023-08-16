do {
# Import the Active Directory module
Import-Module ActiveDirectory

# Set Active Directory Variables
$domain = "domain.local"
$ouStaging = "OU=Staging,OU=Computers,OU=Company,DC=Domain,DC=local"

# Set Title Screen
cls
Write-Host "*************>STAGE FRIGHT<*************" -foreground "red"
Write-Host "********>ACTIVE DIRECTORY TOOL<*********" -foreground "magenta"
Write-Host "*************>VERSION 1.4<**************" -foreground "cyan"

Write-Host ""
Write-Host "WARNING!!!!! THIS WILL MOVE ALL CORRECTLY NAMED OBJECTS IN THE STAGING OU."
Write-Host ""
$choice = Read-Host "ARE YOU SURE YOU WANT TO PROCEED? Enter 'y' for yes or 'n' for no"

# Choices Scripts
if ($choice -eq 'n') {
    Write-Host "Exiting..."
    exit
}
elseif ($choice -eq 'y') {
    Write-Host "Moving Computer Objects, Please Hold..."

# Default OU Paths Variables
$HR = "OU=HR,OU=Computers,OU=Company,DC=Domain,DC=local"
$BF = "OU=BF,OU=Computers,OU=Company,DC=Domain,DC=local"
$Office = "OU=Office,OU=Computers,OU=Company,DC=Domain,DC=local"


# Computer Variables - You would create a section for each default OU Path you set. So there would be one for HR and BF as well.

# **************************************************************

# Office Computers
$ouOfficeDesktops = "OU=Office Desktops,$HR"
$ouOfficeLaptops = "OU=Office Laptops,$BF"
$ouOfficeSurfaces = "OU=Office Surfaces,$Office"

# ****************************************************************************************

# Get computer objects from the Staging OU
$computers = Get-ADComputer -SearchBase $ouStaging -Filter "*" -Properties Name

# ****************************************************************************************

# Move Computers - Scale this as needed. Copy/Paste another foreach statement for each type that needs moved.

# ****************************************************************************************

# Move Office Computers
foreach ($computer in $computers) {
    $computerName = $computer.Name
    
    # Move computers based on name prefixes
    if ($computerName -like "OfficeName1-*" -or $computerName -like "OfficeName2-*" -or $computerName -like "OfficeName3-*") {
        Move-ADObject -Identity $computer -TargetPath $ouOfficeDesktops
    }
    elseif ($computerName -like "OfficeL-*") {
        Move-ADObject -Identity $computer -TargetPath $ouOfficeLaptops
    }
    elseif ($computerName -like "OfficeSP-*" -or $computerName -like "OfficeSG-*") {
        Move-ADObject -Identity $computer -TargetPath $ouOfficeSurfaces
    }
}

# Specify Invalid Input
else {
    Write-Host "Invalid input. Please enter 'y' for yes or 'n' for no."
     }

}

# Set Title Screen
cls
Write-Host "*************>STAGE FRIGHT<*************" -foreground "red"
Write-Host "********>ACTIVE DIRECTORY TOOL<*********" -foreground "magenta"
Write-Host "*************>VERSION 1.4<**************" -foreground "cyan"

# Display Finished Notification
Write-Host ""
Write-Host "Complete. Please wait 5-10 minutes for AD Sync to complete and reflect results."
Write-Host ""

$input = Read-Host "Would you like to return to the main menu? Enter 'y' for yes or 'n' for no"
     switch ($input)
     {
           'y' {
            
                
           }
      }

}

until ($input -eq 'n')
exit
