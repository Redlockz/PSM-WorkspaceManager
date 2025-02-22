function Get-CurrentBranch {
    param (
        [string]$RepositoryPath
    )

    if (-Not (Test-Path -Path $RepositoryPath)) {
        throw "Repository path '$RepositoryPath' does not exist."
    }

    Set-Location -Path $RepositoryPath
    $currentBranch = git rev-parse --abbrev-ref HEAD
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath

    return $currentBranch
}