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
Describe 'Get-GitStrategy' {
    It 'Should return the git strategy configuration' {
        Mock Get-GitStrategy { return @{ Strategy = 'merge' } }
        $result = Get-GitStrategy -RepositoryPath 'path/to/repo'
        $result | Should -Not -BeNullOrEmpty
    }
    It 'Should throw an error if the repository path does not exist' {
        { Get-GitStrategy -RepositoryPath 'invalid/path' } | Should -Throw
    }
}