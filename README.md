## About

This repository contains PowerShell scripts developed while working in IT Operations and while building skills in system administration, Azure, and automation.

## Scripts

### MorningRoutine.ps1
Opens applications commonly used at the start of the workday.

### OrderLunch.ps1
Opens DoorDash order history and automates the reorder process.

### DailyLabCleanup.ps1
Deletes Azure Resource Groups matching the naming convention `Lab-*`.
Runs daily at 1:00 AM through an Azure Automation Account to remove abandoned lab resources and prevent unnecessary Azure costs.

### CreateLabsLoop.ps1
Creates multiple Azure lab environments in a loop. Prompts for lab names and deploys them in East US.

### CreateResourceGroup.ps1
Creates a single Azure Resource Group in the East US region.

### Code-CheatSheet.ps1
Reference collection of commonly used PowerShell commands and scripts.

### AutoEraseOldPics.ps1
Deletes screenshots older than a configured retention period. Scheduled through Windows Task Scheduler to automate cleanup.

### PracticeCode.ps1
Sandbox script used to test and learn new PowerShell concepts.
