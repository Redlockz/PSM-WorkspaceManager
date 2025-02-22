function Get-GitStrategy {
    param (
        [string]$RepositoryPath
    )

    if (-Not (Test-Path -Path $RepositoryPath)) {
        throw "Repository path '$RepositoryPath' does not exist."
    }

    Set-Location -Path $RepositoryPath
    $gitConfig = git config --get-regexp ^branch\..*\.merge$
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath

    return $gitConfig
}