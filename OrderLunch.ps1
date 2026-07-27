Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

function Start-LunchOrder {

    Start-Process "msedge.exe" "https://www.doordash.com/orders"

    Start-Sleep -Seconds 6

    1..38 | ForEach-Object {
        Write-Host "TAB $($_)"
        [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
        Start-Sleep -Milliseconds 1
    }

    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}

while ($true) {

    $choice = [System.Windows.Forms.MessageBox]::Show(
        "Ready to order lunch?`n`nYes = Order Now`nNo = Snooze 15 Minutes`nCancel = Cancel",
        "DoorDash Lunch",
        [System.Windows.Forms.MessageBoxButtons]::YesNoCancel,
        [System.Windows.Forms.MessageBoxIcon]::Question
    )

    switch ($choice) {

        "Yes" {
            Start-LunchOrder
            exit
        }

        "No" {

            $snoozeChoice = [System.Windows.Forms.MessageBox]::Show(
                "Snooze for 15 minutes?`n`nYes = 15 Minutes`nNo = 30 Minutes`nCancel = Cancel",
                "DoorDash Snooze",
                [System.Windows.Forms.MessageBoxButtons]::YesNoCancel,
                [System.Windows.Forms.MessageBoxIcon]::Information
            )

            switch ($snoozeChoice) {

                "Yes" {
                    Start-Sleep -Seconds 900
                }

                "No" {
                    Start-Sleep -Seconds 1800
                }

                "Cancel" {
                    exit
                }
            }
        }

        "Cancel" {
            exit
        }
    }
}