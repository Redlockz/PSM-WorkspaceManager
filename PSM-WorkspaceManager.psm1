# ...existing code...

$VerbosePreference = 'Continue'

# Import all the functions from the src directory
Write-Verbose "Importing functions from src directory..."
Get-ChildItem -Path $PSScriptRoot/WorkspaceManagement/src -Filter *.ps1 | ForEach-Object { 
    Write-Verbose "Importing $($_.FullName)"
    . $_.FullName 
}

# Export the module members
Write-Verbose "Exporting module members..."
Export-ModuleMember -Function Get-CurrentBranch, Get-GitStrategy, Get-MainBranch, Get-RepositoryStatus, Get-TemporaryStash, Get-Workspace, New-Branch, New-Repository, Set-Branch, Set-CommitBranch, Set-GitStrategy, Set-TemporaryStash, Update-AllRepositoriesMain, Update-OriginRepository, Update-Workspace

# ...existing code...
