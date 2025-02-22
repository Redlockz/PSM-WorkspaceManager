function Get-TemporaryStash {
    param (
        [string]$BranchName
    )

    # Navigate to the repository directory
    Set-Location -Path (Get-Workspace)

    # Get the stash list for the specified branch
    $stashList = git stash list | Select-String -Pattern $BranchName

    return $stashList
}