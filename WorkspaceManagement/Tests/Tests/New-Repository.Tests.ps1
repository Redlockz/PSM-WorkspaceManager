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

Describe 'New-Repository' {
    It 'should perform the expected behavior' {
        Mock New-Repository { return 'path/to/new-repo' }
        $result = New-Repository -Path 'path/to/new-repo'
        $result | Should -Be 'path/to/new-repo'
    }
}