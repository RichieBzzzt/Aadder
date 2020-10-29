Describe "Connect to AAD" {
    it "Should not throw" {
        Set-Location $PSScriptRoot
        Import-Module "..\Aadder.psm1" -Force
        { Connect-Aadder -InstallAzureAD } | Should Not Throw
    }
}