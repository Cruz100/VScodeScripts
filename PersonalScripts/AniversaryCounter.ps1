Add-Type -AssemblyName System.Windows.Forms

<#.SYNOPSIS Counter for special dates in a relationship.
.DESCRIPTION This script creates a full-screen window for each special date, showing the time elapsed since that date in days, hours, minutes, and seconds. 
It includes a title for each event and a button to proceed to the next one. The windows are designed to be visually appealing with a black background, yellow titles, and white text for the time elapsed.
#>
# 1. Define the special dates and their corresponding titles and messages in an array of hashtables
$Dates = @(
    @{ Title = "NUESTRO COMIENZO"; Date = [datetime]"2025-03-08 20:30:00"; Msg = "Tiempo desde que empezo nuestra aventura:" },
    @{ Title = "NUESTRA PROMESA"; Date = [datetime]"2026-01-24 21:20:00"; Msg = "Tiempo desde que decidimos ser felices:" },
    @{ Title = "NUESTRO MILAGRO"; Date = [datetime]"2026-02-25 12:45:00"; Msg = "Tiempo desde que la pelota mas hermosa se nos unio:" }
)

#Show-LifeWindow -Title "NUESTRO COMIENZO" -EventDate [datetime]"2025-03-08 20:30:00" -Description "Tiempo desde que empezó nuestra aventura:"
function Show-LifeWindow {
   
    param($Title, $EventDate, $Description)

    $TimeSince = New-TimeSpan -Start $EventDate -End (Get-Date)

    # Create a 1080p form with a black background and no borders, centered on the screen
    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $Title
    $Form.Size = New-Object System.Drawing.Size(1920, 1080)
    $Form.StartPosition = "CenterScreen"
    $Form.BackColor = "Black"
    $Form.FormBorderStyle = "None"
    $Form.Topmost = $true

    #Dedicated Title Label at the top with a larger font size and yellow color
    $TitleLabel = New-Object System.Windows.Forms.Label
    $TitleLabel.Size = New-Object System.Drawing.Size(1800, 200)
    $TitleLabel.Location = New-Object System.Drawing.Point(60, 50) # Near the top
    $TitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 65, [System.Drawing.FontStyle]::Bold)
    $TitleLabel.ForeColor = "Yellow" 
    $TitleLabel.TextAlign = "MiddleCenter"
    $TitleLabel.Text = $Title.ToUpper()

    # Main Label for the time since the event with a larger font size and white color
    $Label = New-Object System.Windows.Forms.Label
    $Label.Size = New-Object System.Drawing.Size(1800, 600)
    $Label.Location = New-Object System.Drawing.Point(60, 200)
    $Label.Font = New-Object System.Drawing.Font("Segoe UI", 40, [System.Drawing.FontStyle]::Bold)
    $Label.ForeColor = "White"
    $Label.TextAlign = "MiddleCenter"
    $Label.Text = "$Description`n`n$($TimeSince.Days) Dias, $($TimeSince.Hours) Horas, $($TimeSince.Minutes) Minutos y $($TimeSince.Seconds) Segundos"

    # Button to proceed to the next window with a larger size, red background, and white text
    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point(810, 850)
    $Button.Size = New-Object System.Drawing.Size(300, 80)
    $Button.Text = "Siguiente"
    $Button.FlatStyle = "Flat"
    $Button.ForeColor = "White"
    $Button.BackColor = "DarkRed"
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::OK

    # Add controls to the form and show it
    $Form.Controls.Add($TitleLabel)
    $Form.Controls.Add($Label)
    $Form.Controls.Add($Button)
    $Form.ShowDialog() | Out-Null
}

# 3. Loop through and show each window for the special dates with the appropriate title and description
foreach ($Entry in $Dates) {
    Show-LifeWindow -Title $Entry.Title -EventDate $Entry.Date -Description $Entry.Msg
}