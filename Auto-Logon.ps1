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
        VerifyInput($TheirResponse, WouldYouLikeToSetupAutoLogin)
        IsYourComputerOnADomain
    }
    else
    {
        WouldYouLikeToSetupAutoLogin
    }
}

function IsYourComputerOnADomain()
{
    
}

function EnterTheDomainName
{

}

function EnterTheUserName
{

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
        $FunctionToCall
    }
    elseif ($Confirmation -contains 'yes')
    {
        write-host "Moving on"
        break
    }
}

WouldYouLikeToSetupAutoLogin
