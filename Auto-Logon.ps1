function WouldYouLikeToSetupAutoLogin
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

function IsYourComputerOnADomain
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

}

function VerifyInput
{

}

WouldYouLikeToSetupAutoLogin