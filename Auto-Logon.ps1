function WouldYouLikeToSetupAutoLogin()
{
    $TheirResponse = Read-Host -Prompt "Would you like to setup auto logon for this device? yes/no"

    if ($TheirResponse -contains 'no')
    {
        write-host "Okay, Goodbye!"

        Start-Sleep -seconds 3

        exit
    }
    elseif ($TheirResponse -contains 'yes')
    {
        
        IsYourComputerOnADomain
    }
    else
    {
        WouldYouLikeToSetupAutoLogin
    }
}

function IsYourComputerOnADomain()
{
    $OnDomain = Read-Host "Is your computer on a domain? yes/no"

    if ($OnDomain -contains 'no')
    {
        Write-host "Great! Moving on!"

        EnterTheUserName
    }
    elseif ($TheirResponse -contains 'yes')
    {
        EnterTheDomainName
    }
    else
    {
        IsYourComputerOnADomain
    }
}

function EnterTheDomainName
{
    $DomainName = Read-Host "What is the domain name?"

    VerifyInput($DomainName)

    #Create The Registry Key


    EnterTheUserName
}

function EnterTheUserName
{
    $Username = Read-Host "Enter the username?"

    VerifyInput($Username)

    #Create The Registry Key

    EnterThePassword
}

function EnterThePassword
{
    $UserPassword = Read-Host "Enter the user password" -AsSecureString
    $UserConfirmationPassword = Read-Host "Confirm the user password" -AsSecureString
    
    if ($UserPassword -ne $UserConfirmationPassword)
    {
        Write-Host "Those passwords do not match. Please enter them again."
        Start-Sleep -seconds 1
        EnterThePassword
     }
     else
     {
        #Create registry key for password
     }
}

function VerifyInput([string] $UserInput, [scriptblock] $FunctionToCall)
{
    $Confirmation = read-host "Is " $UserInput " correct? yes/no"

    if ($Confirmation -contains 'no')
    {
        Invoke-Command $FunctionToCall
    }
    elseif ($Confirmation -contains 'yes')
    {
        write-host "Moving on"
        break
    }
}

WouldYouLikeToSetupAutoLogin
