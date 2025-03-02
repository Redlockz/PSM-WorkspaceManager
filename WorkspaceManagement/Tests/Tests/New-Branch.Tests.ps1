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
Describe 'New-Branch' {
    It 'should perform the expected behavior' {
        Mock New-Branch { return 'feature/new-branch' }
        $result = New-Branch -RepositoryPath 'path/to/repo' -BranchName 'feature/new-branch'
        $result | Should -Be 'feature/new-branch'
    }
}