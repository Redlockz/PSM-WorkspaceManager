function Set-TemporaryStash {
    param (
        [string]$Path = (Get-Location)
    )

    # Navigate to the specified path
    Push-Location -Path $Path

    try {
        # Check if the directory is a git repository
        if (-not (Test-Path -Path "$Path/.git")) {
            Write-Error "The specified path is not a git repository."
            return
        }

        # Stash uncommitted changes
        git stash save "Temporary stash by Set-TemporaryStash function"

        Write-Output "Changes have been stashed temporarily."
    }
    catch {
        Write-Error "An error occurred: $_"
    }
    finally {
        # Return to the original location
        Pop-Location
    }
}