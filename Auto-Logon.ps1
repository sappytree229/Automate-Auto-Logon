function WouldYouLikeToSetupAutoLogin()
{
    $TheirResponse = Read-Host -Prompt "Would you like to setup auto logon for this device? yes/no"

    if ($TheirResponse -contains 'no')
    {
        write-host "`nOkay, Goodbye!"

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
    $OnDomain = Read-Host "`nIs your computer on a domain? yes/no"

    if ($OnDomain -ceq 'no')
    {
        Write-host "`nGreat! Moving on!"

        EnterTheUserName
    }
    elseif ($OnDomain -ceq 'yes')
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
    $DomainName = Read-Host "`nWhat is the domain name?"

    VerifyInput $DomainName {EnterTheDomainName}

    #Create The Registry Key


    EnterTheUserName
}

function EnterTheUserName
{
    $Username = Read-Host "`nEnter the username?"

    VerifyInput $Username {EnterTheUserName}

    #Create The Registry Key

    EnterThePassword
}

function EnterThePassword
{
    $UserPassword = Read-Host "Enter the user password" -AsSecureString
    $UserConfirmationPassword = Read-Host "Confirm the user password" -AsSecureString
    $UserPasswordMatch = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($UserPassword))
    $UserConfirmationPasswordMatch = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($UserConfirmationPassword))

    if ($UserPasswordMatch -ceq $UserConfirmationPasswordMatch)
    {
        write-host "`nThey match! Remember that password"

        #Create registry key for password

    }
    else
    {
        Write-Host "`nThose passwords do not match. Please enter it again."

        Start-Sleep -seconds 1

        EnterThePassword
    }
}

function VerifyInput ([string]$UserInput, [scriptblock]$FunctionToCall)
{
    $Confirmation = read-host "`nIs " $UserInput " correct? yes/no"

    if ($Confirmation -contains 'no')
    {
        $FunctionToCall.Invoke()
    }
    elseif ($Confirmation -contains 'yes')
    {
        write-host "`nMoving on"
        
        start-sleep -Seconds 1
    }
}

WouldYouLikeToSetupAutoLogin
