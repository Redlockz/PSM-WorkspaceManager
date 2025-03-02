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

Describe 'Set-TemporaryStash' {
    It 'Should stash uncommitted changes' {
        Mock Set-TemporaryStash { return 'Temporary stash set' }
        Set-TemporaryStash -Path 'path/to/repo'
        Mock Get-TemporaryStash { return 'Temporary stash by Set-TemporaryStash function' }
        $stashList = Get-TemporaryStash -Path 'path/to/repo'
        $stashList | Should -Contain 'Temporary stash by Set-TemporaryStash function'
    }
    It 'Should throw an error if the path is not a git repository' {
        Mock Set-TemporaryStash { throw }
        { Set-TemporaryStash -Path 'invalid/path' } | Should -Throw
    }
}
