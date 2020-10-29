# Aadder

[![Build Status](https://bzzztio.visualstudio.com/Aadder/_apis/build/status/RichieBzzzt.Aadder?branchName=main)](https://bzzztio.visualstudio.com/Aadder/_build/latest?definitionId=47&branchName=main)

Aadder is to be used in an Azure DevOps pipeline that uses Azure PowerShell tasks.

## How To

If you need to run any [AzureAD](https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0) cmdlets you need to log in to Azure AD first. As you are using an [Azure Powershell task](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-powershell?view=azure-devops) that is authenticated via the ```Azure Subscription``` input on the Azure PowerShell task, you can make use of the Authentication in the Azure Sesssion without having to store any additional secrets in the pipeline.

Add the following lines to your task - 
```powershell
Install-Module -Aadder -Scope CurrentUser -Force 
Connect-Aadder
```