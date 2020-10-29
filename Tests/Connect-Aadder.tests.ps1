Describe "Connect to AAD" {
Set-Location $PSScriptRoot
Import-Module "..\Aadder.psm1" -Force
Connect-Aadder | Should Not Throw
}