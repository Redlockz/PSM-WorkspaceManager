function Get-MainBranch {
    param (
        [string]$Path = (Get-Location)
    )

    # Navigate to the specified path
    Push-Location -Path $Path

    try {
        # Check if the directory is a Git repository
        if (-not (Test-Path -Path ".git")) {
            throw "The specified path is not a Git repository."
        }

        # Get the main branch name
        $mainBranch = git symbolic-ref refs/remotes/origin/HEAD | ForEach-Object { $_ -replace 'refs/remotes/origin/', '' }

        if (-not $mainBranch) {
            throw "Unable to determine the main branch name."
        }

        return $mainBranch
    }
    catch {
        Write-Error $_
    }
    finally {
        # Return to the original location
        Pop-Location
    }
}