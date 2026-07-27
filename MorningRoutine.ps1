<#.Syntax PowerShell 
.Description
This PowerShell script is designed to automate the morning routine of an IT Analyst by launching essential web portals and local desktop applications.
It opens Microsoft Edge for web-based tools and specific applications like Outlook and Microsoft Teams to ensure a productive start to the day.

#>

$WebPortals = @(
    "https://jti.service-now.com/"
    "https://entra.microsoft.com/"

)

$LocalApps = @(
    "C:\Program Files\Google\Chrome\Application\chrome.exe"
    "msedge.exe"
    "$env:LOCALAPPDATA\Microsoft\WINDOWSAPPS\olk.exe"
    "$env:LOCALAPPDATA\Microsoft\WINDOWSAPPS\ms-teams.exe"
)


# Loop through and open all local desktop applications
foreach ($App in $LocalApps) {
    if ($App -like "*olk.exe" -or $App -like "*ms-teams.exe") {
        # Modern Windows Store apps require direct execution handling
        if (Test-Path $App) {
            Start-Process $App
        } else {
            Write-Host "Modern App execution path not found: $App" -ForegroundColor Red
        }
    } else {
        # Standard system apps like Edge can be launched directly by name
        Start-Process $App
    }
    Start-Sleep -Milliseconds 250 # Give the system a brief breathing room between launches
}

# Loop through and open all core web portals inside Edge
foreach ($Portal in $WebPortals) {
    
    Start-Process $Portal
    Start-Sleep -Milliseconds 250
}

Write-Host "✅ Workspace deployment complete! " -ForegroundColor Green