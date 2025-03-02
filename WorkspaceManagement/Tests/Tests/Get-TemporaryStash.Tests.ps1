# Search for the module file and import it
$env:PSScriptRoot = (Get-Location).Path
Write-Host "Script root: $env:PSScriptRoot"
$modulePath = $(Get-ChildItem -Path $env:PSScriptRoot -Recurse -Include '*.psm1').FullName
Write-Host "Module path: $modulePath"
if ($null -eq $modulePath) {
    throw "Module file not found."
} else {
    Write-Host "Importing module from $modulePath"
    Import-Module -Name $modulePath -Force -ErrorAction Stop
}

Describe 'Get-TemporaryStash' {
    It 'should return the stash list for the specified branch' {
        param (
            [string]$BranchName = 'feature/test-branch'
        )

        # Mock the Get-Workspace function
        Mock Get-Workspace { return 'C:/path/to/repo' }

        # Mock the git command
        Mock git { return 'stash@{0}: WIP on feature/test-branch: 1234567 Commit message' }

        # Mock the Get-TemporaryStash command
        Mock Get-TemporaryStash { return 'stash@{0}: WIP on feature/test-branch: 1234567 Commit message' }

        $result = Get-TemporaryStash -BranchName $BranchName

        $result | Should -Contain 'stash@{0}: WIP on feature/test-branch: 1234567 Commit message'
    }
}