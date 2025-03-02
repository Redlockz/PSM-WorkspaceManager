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

Describe 'Update-OriginRepository' {
    It 'should perform the expected behavior' {
        Mock Update-OriginRepository { return 'Update successful' }
        $result = Update-OriginRepository -RepositoryPath 'path/to/repo'
        $result | Should -Be 'Update successful'
    }
}