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

Describe "Get-Workspace" {
    It "should return a list of repositories" {
        Mock Get-Workspace { return @(
            @{ Name = "repo1"; Path = 'path/to/repo1' },
            @{ Name = "repo2"; Path = 'path/to/repo2' }
        ) }
        $result = Get-Workspace -Path "test"
        $result | Should -BeOfType "HashTable"
    }
}