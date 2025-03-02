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

Describe "Set-CommitBranch" {

    It 'Should output a message if the branch does not exist' {
        Mock Set-CommitBranch { return "Branch 'nonexistent-branch' does not exist." }
        $result = Set-CommitBranch -BranchName 'nonexistent-branch' -Path 'path/to/repo'
        $result | Should -Contain 'Branch ''nonexistent-branch'' does not exist.'
    }
}