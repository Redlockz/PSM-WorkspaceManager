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

Describe 'Get-RepositoryStatus' {
    It 'Should return the repository status' {
        Mock Get-RepositoryStatus { return @{ Status = 'Clean' } }
        $result = Get-RepositoryStatus -RepositoryPath 'path/to/repo'
        $result | Should -Not -BeNullOrEmpty
    }
    It 'Should throw an error if the repository path does not exist' {
        { Get-RepositoryStatus -RepositoryPath 'invalid/path' } | Should -Throw
    }
}