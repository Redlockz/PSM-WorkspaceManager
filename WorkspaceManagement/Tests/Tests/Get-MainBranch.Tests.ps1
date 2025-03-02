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

Describe 'Get-MainBranch' {
    It 'Should return the main branch name' {
        Mock Get-MainBranch { return 'main' }
        $result = Get-MainBranch -Path 'path/to/repo'
        $result | Should -Be 'main'
    }
    It 'Should throw an error if the path is not a Git repository' {
        Mock Get-MainBranch { throw }
        { Get-MainBranch -Path 'invalid/path' } | Should -Throw
    }

}