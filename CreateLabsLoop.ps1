

try {
      $Count = Read-Host "How many ResourceGroups named Lab do you want to create?"

if ($Count -as [int] -le 0) {
    throw "Invalid Input '$Count'. Please enter a positive integer."
    
}

for ($i=1; $i -le $Count; $i++) {
   
    $NameSuffix = Read-Host "Enter Lab name suffix for ResourceGroup #$i (The Lab- prefix will be added automatically)"
    $FullGroupName = "Lab-$NameSuffix"

    Write-Host "Creating Resource Group: $FullGroupName" -ForegroundColor Green

    New-AzResourceGroup -Name $FullGroupName -Location "EastUS" -ErrorAction Stop
}
}
catch {
    Write-Host "An error occurred: $($_.Exception.Message)" -ForegroundColor Red
}


