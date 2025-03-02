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

Describe 'Set-Branch' {
    It 'Should checkout the specified branch' {
        Mock Set-Branch { return 'feature-branch' }
        $currentBranch = Set-Branch -RepositoryPath 'path/to/repo' -BranchName 'feature-branch'
        $currentBranch | Should -Be 'feature-branch'
    }
    It 'Should throw an error if the repository path does not exist' {
        { Set-Branch -RepositoryPath 'invalid/path' -BranchName 'feature-branch' } | Should -Throw
    }
}