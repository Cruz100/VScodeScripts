<#.<Synopsis 
This file is not meant to be run as a script, but rather to store code snippets that can be copied and reused in other scripts or runbooks.
.Description
This file contains code snippets for importing a PowerShell script as an Azure Automation Runbook and for
#>


<#Imports a script as an Azure Automation Runbook. This script is designed to clean up resources in a lab environment on a daily basis.
**************************************************************************************************************************************
Import-AzAutomationRunbook `
>> -Path "C:\Users\javie\VScodeScripts\DailyLabCleanup.ps1" `
>> -ResourceGroupName "MainGroup" `
>> -AutomationAccountName "ScriptAutomation" `
>> -Type PowerShell `
>> -Name "DailyLabCleanup" `
>> -Force
#>

<#Publishes the imported script as a runbook in Azure Automation, making it available for scheduling and execution within the Azure environment.
**************************************************************************************************************************************
Publish-AzAutomationRunbook `
>>     -RunbookName "DailyLabCleanup" `
>>     -ResourceGroupName "MainGroup" `
>>     -AutomationAccountName "ScriptAutomation"#>

<#Creates a new file
**************************************************************************************************************************************
ni "NameOfFile.ps1" -ItemType "file"#>

<#Registers the published runbook to run on a daily schedule, allowing for automated execution of the tasks defined in the runbook.
**************************************************************************************************************************************
Register-AzAutomationScheduledRunbook `
>> -ResourceGroupName "MainGroup" `
>> -AutomationAccountName "ScriptAutomation" `
>> -RunbookName "DailyLabCleanup" `
>> -ScheduleName "NameOfSchedule" #>

