Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -force

#Gathers the information needed to create the user account in AD on DC01 for Platt College

$FullName = Read-Host -Prompt "Please enter the full name of the user being created"
$Username = Read-Host -Prompt "Please enter the username of the account you wish to create"
$Password = Read-Host -Prompt "Please enter the password for this account" -AsSecureString
$EmailAddress = Read-Host -Prompt "Please enter the email address for this account (should be in firstinitiallastname@plattcollege.edu format)"
$OU = "OU=Users, OU=Colocation, DC=plattcollege, DC=local"

#Creates the AD Account for the user

New-ADUser -Name "$FullName" -DisplayName "$FullName" -SamAccountName $Username -AccountPassword $Password -PasswordNeverExpires $false -enabled $true -EmailAddress $EmailAddress -Path $OU -UserPrincipalName $Username@plattcollege.local