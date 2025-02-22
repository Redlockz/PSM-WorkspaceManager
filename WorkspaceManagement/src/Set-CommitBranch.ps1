function Set-CommitBranch {
    param (
        [string]$BranchName,
        [string]$Path = (Get-Location)
    )

    # Change to the specified path
    Push-Location -Path $Path

    try {
        # Check if the specified branch exists
        $branchExists = git branch --list $BranchName

        if ($branchExists) {
            # Checkout the specified branch
            git checkout $BranchName
            Write-Output "Switched to branch '$BranchName'."
        } else {
            Write-Output "Branch '$BranchName' does not exist."
        }
    } catch {
        Write-Error "An error occurred: $_"
    } finally {
        # Return to the original path
        Pop-Location
    }
}