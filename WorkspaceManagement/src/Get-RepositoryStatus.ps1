function Get-RepositoryStatus {
    param (
        [string]$RepositoryPath
    )

    if (-Not (Test-Path -Path $RepositoryPath)) {
        throw "Repository path '$RepositoryPath' does not exist."
    }

    Set-Location -Path $RepositoryPath
    $status = git status
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath

    return $status
}