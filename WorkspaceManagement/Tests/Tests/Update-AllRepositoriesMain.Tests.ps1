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

Describe 'Update-AllRepositoriesMain' {
    It 'Should update all repositories in the specified path' {
        Mock Update-AllRepositoriesMain { return 'Update successful' }
        Update-AllRepositoriesMain -Path 'path/to/workspace'
        # Add assertions to verify the update process
    }
    It 'Should handle non-git directories gracefully' {
        Mock Update-AllRepositoriesMain { return 'Handled non-git directories' }
        Update-AllRepositoriesMain -Path 'path/to/workspace'
        # Add assertions to verify handling of non-git directories
    }
}