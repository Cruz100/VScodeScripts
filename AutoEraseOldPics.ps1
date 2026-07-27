<#.Synopsis#>
    Removes the oldest images from a specified folder until the number of images matches a maximum count.
    .Description
    This script is designed to manage the number of image files in a specified directory. It will
    remove the oldest images until the total number of images in the directory matches the specified maximum count to maintain a clean and organized folder. 
    The script supports common image file extensions such as .jpg, .jpeg, .png, .gif, and .bmp.
#>

# --- CONFIGURATION ---
$FolderPath = "C:\Users\lgu6885\OneDrive - JT International\Pictures\Screenshots"
$MaxImages  = 50
$ImageExts  = @(".jpg", ".jpeg", ".png", ".gif", ".bmp")

# Check if target directory exists
if (-not (Test-Path -Path $FolderPath)) {
    Write-Warning "Folder path does not exist: $FolderPath"
    exit
}

# Approved Verb naming standard for functions
function Remove-OldestImages {
    param (
        [string]$Path,
        [int]$MaxCount
    )

    # Fetch matching images sorted by oldest write time first
    $images = Get-ChildItem -Path $Path -File | 
        Where-Object { $ImageExts -contains $_.Extension.ToLower() } |
        Sort-Object LastWriteTime

    # Purge oldest items until folder count matches $MaxCount
    while ($images.Count -gt $MaxCount) {
        $oldest = $images[0]
        try {
            Remove-Item -Path $oldest.FullName -Force -ErrorAction Stop
            Write-Host "Deleted oldest image: $($oldest.Name)" -ForegroundColor Yellow

            # Remove deleted item from array to avoid re-querying disk
            $images = $images | Select-Object -Skip 1
        }
        catch {
            Write-Error "Failed to delete $($oldest.Name): $_"
            break
        }
    }
}

# Execute cleanup and exit
Remove-OldestImages -Path $FolderPath -MaxCount $MaxImages