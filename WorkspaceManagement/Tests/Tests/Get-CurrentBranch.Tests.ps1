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

Describe 'Get-CurrentBranch' {
    It 'Should return the current branch name' {

        # Mock the git command

        Mock Get-CurrentBranch { return 'main' }
        $result = Get-CurrentBranch -RepositoryPath 'path/to/repo'
        $result | Should -Be 'main'
    }
    It 'Should throw an error if the repository path does not exist' {
        { Get-CurrentBranch -RepositoryPath 'invalid/path' } | Should -Throw
    }
}