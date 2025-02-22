function Set-Branch {
    param (
        [string]$RepositoryPath,
        [string]$BranchName
    )

    if (-Not (Test-Path -Path $RepositoryPath)) {
        throw "Repository path '$RepositoryPath' does not exist."
    }

    Set-Location -Path $RepositoryPath
    git checkout $BranchName
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath
}