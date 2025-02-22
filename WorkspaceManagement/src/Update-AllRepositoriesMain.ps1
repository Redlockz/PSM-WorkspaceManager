function Update-AllRepositoriesMain {
    param (
        [string]$Path = (Get-Location)
    )

    # Get all directories in the specified path
    $directories = Get-ChildItem -Path $Path -Directory

    foreach ($dir in $directories) {
        Write-Host "Updating repository in $($dir.FullName)"
        Set-Location -Path $dir.FullName

        # Check if the directory is a git repository
        if (Test-Path -Path "$($dir.FullName)\.git") {
            # Checkout the main branch
            git checkout main

            # Pull the latest changes
            git pull origin main
        } else {
            Write-Host "$($dir.FullName) is not a git repository."
        }
    }

    # Return to the original path
    Set-Location -Path $Path
}