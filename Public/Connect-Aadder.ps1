Function Connect-Aadder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]        
        [switch]
        $InstallAzureAD,
        [Parameter(Mandatory = $false, ParameterSetName = 'graph')]  
        [switch]
        $graph
    )
    if ($PSBoundParameters.ContainsKey('InstallAzureAD') -eq $true) {
        Install-Module AzureAD -Scope CurrentUser -AllowClobber -Force -Verbose
    }
    Import-Module AzureAD -Force

    $context = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile.DefaultContext

    $ConnectAzureAd = @{
        AccountId = $context.Account.Id
        TenantId  = $context.Tenant.Id
    }

    $aadToken = [Microsoft.Azure.Commands.Common.Authentication.AzureSession]::Instance.AuthenticationFactory.Authenticate($context.Account, $context.Environment, $context.Tenant.Id.ToString(), $null, [Microsoft.Azure.Commands.Common.Authentication.ShowDialog]::Never, $null, "https://graph.windows.net").AccessToken
    $ConnectAzureAd.Add("AadAccessToken", $aadToken)

    if ($PSBoundParameters.ContainsKey('graph') -eq $true) {
        Write-Host "Adding Graph Token"
        $graphToken = [Microsoft.Azure.Commands.Common.Authentication.AzureSession]::Instance.AuthenticationFactory.Authenticate($context.Account, $context.Environment, $context.Tenant.Id.ToString(), $null, [Microsoft.Azure.Commands.Common.Authentication.ShowDialog]::Never, $null, "https://graph.microsoft.com").AccessToken
        $ConnectAzureAd.Add("MsAccessToken", $graphToken)
    }

    Connect-AzureAD @ConnectAzureAd -Verbose
}


