#.Synopsis
#Prompts for a name and gets date.Outputs name in Cyan and date in default color.
#.Description
<#This script demonstrates how to use Write-Host with different foreground colors to display a message that includes a user's name in cyan and the current date in the default color. 
It prompts the user for their name, retrieves the current date, and then constructs a greeting message that highlights the user's name while keeping the date in the standard console color.#>


$Name = Read-Host -Prompt "Enter your name: "
$Date = Get-Date
Write-Host "Hello " -NoNewline; Write-Host $Name -ForegroundColor Cyan -NoNewline;  " you're logged in at $Date"