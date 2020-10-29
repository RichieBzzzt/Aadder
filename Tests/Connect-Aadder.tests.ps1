Describe "Connect to AAD" {
Set-Location $PSScriptRoot
Import-Module "..\Aadder.psm1" -Force
Connect-Aadder -InstallAzureAD | Should Not Throw
}