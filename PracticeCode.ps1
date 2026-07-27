#Wrap your code in a if statement to allow for better organization and reusability
#This PowerShell script provides practice code for both array manipulation and conditional statements.
#The user can choose which type of practice they want to engage in, and the script will execute the corresponding code block based on their selection.
Read-Host "Enter 1 for Array Practice Code or 2 for Conditional Practice Code: " -OutVariable choice
if($choice -eq 1){
    Write-Host "You have selected option 1: Array Practice Code" -ForegroundColor Cyan

#Array Practice Code
$Array= @("Server 1","Server 2","Server 3","Server 4","Server 5")
$Position = Read-Host "Enter the position on the array you want to access (0-4): "
Write-Host "The array contains the following item: " $Array[$Position] "on specified position $Position" -ForegroundColor Green
}
#----------------------------------------------------
elseif($choice -eq 2){
    Write-Host "You have selected option 2: Conditional Practice Code" -ForegroundColor Cyan
#Conditional Practice Code
$CPULoad=75

#Use if, elseif, and else statements to evaluate the CPU load and provide feedback based on the value
If ($CPULoad -gt 80){
    Write-Host "CPU load is high: $CPULoad%" -ForegroundColor Red
}
ElseIf ($CPULoad -gt 50){
    Write-Host "CPU load is moderate: $CPULoad%" -ForegroundColor Yellow
}
Else{
    Write-Host "CPU load is fine: $CPULoad%" -ForegroundColor Green
}
}
#----------------------------------------------------
#If the user input does not match either option, provide feedback about the invalid selection
else{
    Write-Host "Invalid selection. Please choose either 1 or 2." -ForegroundColor Red
}