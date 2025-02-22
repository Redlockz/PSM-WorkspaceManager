function Set-GitStrategy {
    param (
        [string]$RepositoryPath,
        [string]$BranchName,
        [string]$MergeStrategy
    )

    if (-Not (Test-Path -Path $RepositoryPath)) {
        throw "Repository path '$RepositoryPath' does not exist."
    }

    Set-Location -Path $RepositoryPath
    git config branch.$BranchName.merge $MergeStrategy
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath
}