<#.Synopsis
 Deletes a specified resource group and all its resources.
.Description
 This script prompts the user to input the name of a resource group they wish to delete. It then confirms the deletion and proceeds to remove the resource group and all its resources.
 .EXAMPLE
 .\CleanSaveCredit.ps1
 "Input the name of the resource group you want to delete (e.g., Lab-az104)"
#>
$Groups = Get-AzResourceGroup


if (-not ($Groups)) {
    Write-Host "No Azure context found. Please log in using Connect-AzAccount or there is no active groups." -ForegroundColor Red
    exit
}
# Display the list of resource groups to the user
Get-AzResourceGroup | Select-Object -ExpandProperty ResourceGroupName

# Prompt the user to input the name of the resource group they want to delete
Write-Host "Input the name of the resource group you want to delete (e.g., Lab-az104)"
$TargetRG = Read-Host

# Check if the specified resource group exists
Write-Host "Targeting: $TargetRG" -ForegroundColor Cyan

Write-Host "WARNING: You are about to delete the resource group $TargetRG and all its resources. This action cannot be undone." -ForegroundColor Red
$confirmation = Read-Host "Type 'DELETE' to confirm"

# If the user confirms the deletion, proceed to delete the resource group
if ($confirmation -eq "DELETE") {
    Write-Host "Deleting resource group $TargetRG..." -ForegroundColor Yellow
    Remove-AzResourceGroup -Name $TargetRG -Force -AsJob
   
} else {
    Write-Host "Deletion cancelled. Resource group $TargetRG has not been deleted." -ForegroundColor Green
}