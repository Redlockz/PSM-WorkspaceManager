function Update-OriginRepository {
    param (
        [string]$RepositoryPath,
        [string]$NewOriginUrl
    )
    if (-Not (Test-Path -Path $RepositoryPath)) {
        throw "Repository path '$RepositoryPath' does not exist."
    }
    Set-Location -Path $RepositoryPath
    git remote set-url origin $NewOriginUrl
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath
}