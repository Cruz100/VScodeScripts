<#.Synopsis
    Deletes all ResourceGroups named Lab-*
.Description
    This script retrieves all Azure Resource Groups with names that start with "Lab-" and deletes them. 
    It uses a Try/Catch block to handle errors and runs the deletion as a background job.
#>

# Ensure the script logs in using the Managed Identity
Connect-AzAccount -Identity

# Set the context to your subscription (important if you have multiple)
Set-AzContext -Subscription "Azure subscription 1"

# 1. Set the preference to stop on all errors so 'catch' can see them
$ErrorActionPreference = "Stop"

$Groups = Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -like "Lab-*" }

# 2. Check if there are any resource groups to delete
if (-not ($Groups)) {
    Write-Output "No resource groups found with the name pattern 'Lab-*'."
    return
}

# 3. Loop through each group with proper Error Handling
foreach ($Group in $Groups) {
    try {
        Write-Output "Attempting to start deletion for: $($Group.ResourceGroupName)"
        Remove-AzResourceGroup -Name $Group.ResourceGroupName -Force -AsJob
    }
    catch {
        # This handles issues like permissions or connectivity per group
        $msg = $_.Exception.Message
        Write-Error "Failed to start job for $($Group.ResourceGroupName): $msg"
    }
}