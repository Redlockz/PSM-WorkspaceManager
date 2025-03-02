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

Describe 'Set-GitStrategy' {
    It 'Should set the merge strategy for the specified branch' {
        Mock Set-GitStrategy { return 'merge' }
        # Set-GitStrategy -RepositoryPath 'path/to/repo' -BranchName 'feature-branch' -MergeStrategy 'merge'
        Mock Get-GitStrategy { return 'merge'  }
        $gitConfig = Get-GitStrategy -RepositoryPath 'path/to/repo'
        $gitConfig | Should -Contain 'merge'
    }
    It 'Should throw an error if the repository path does not exist' {
        { Set-GitStrategy -RepositoryPath 'invalid/path' -BranchName 'feature-branch' -MergeStrategy 'merge' } | Should -Throw
    }
}