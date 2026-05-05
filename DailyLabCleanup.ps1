<#.Synopsis
 Deletes all ResourceGroups named Lab-*
.Description
    This script retrieves all Azure Resource Groups with names that start with "Lab-" and deletes them. It checks for an active Azure context and ensures that there are matching resource groups before attempting deletion. 
    The deletion is performed as a background job to allow for asynchronous processing.
 .EXAMPLE
    .\DailyLabCleanup.ps1
#>
$Groups = Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -like "Lab-*" }


if (-not ($Groups)) {
    Write-Host "No Azure context found. Please log in using Connect-AzAccount or there are no active groups." -ForegroundColor Red
    return
}


if ($Groups.Count -eq 0) {
    Write-Host "No resource groups found with the name pattern 'Lab-*'." -ForegroundColor Yellow
    return
}

Remove-AzResourceGroup -Name $Groups.ResourceGroupName -Force -AsJob