<#
.SYNOPSIS>
    This script creates a new Azure resource group in the EastUS location.

.DESCRIPTION>
    This script prompts the user to enter a name for a new Azure resource group. 
    It validates that the name is not empty and checks if a resource group with the same name already exists. If the name is valid and unique, it proceeds to create the resource group in the EastUS location. The script also includes error handling to catch any issues that may arise during the creation process.
#>

Write-Host "ResourceGroup name for creation in EastUS?" -ForegroundColor Green
$ResourceGroupName = Read-Host

# Validate that the resource group name is not empty
if ([string]::IsNullOrWhiteSpace($ResourceGroupName)) {
    Write-Host "Resource group name cannot be empty. Please run the script again and provide a valid name." -ForegroundColor Red
    exit
}

#Check if the resource group already exists
$existingRG = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
if ($existingRG) {
    Write-Host "A resource group with the name '$ResourceGroupName' already exists. Please choose a different name." -ForegroundColor Red
    exit
}

#Create the resource group

try {Write-Host "Creating a new resource group named $ResourceGroupName
 in the 'EastUs' location..." -ForegroundColor Green

New-AzResourceGroup -Name $ResourceGroupName -Location "EastUs"  -ErrorAction Stop
Write-Host "Resource group '$ResourceGroupName' created successfully in 'EastUs'." -ForegroundColor Green
}
# Catch any exceptions that occur during the resource group creation process
catch {
    Write-Host "An error occurred while creating the resource group: $($_.Exception.Message)" -ForegroundColor Red
}