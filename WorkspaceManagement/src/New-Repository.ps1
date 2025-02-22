function New-Repository {
    param (
        [string]$RepositoryPath
    )
    if (Test-Path -Path $RepositoryPath) {
        throw "Repository path '$RepositoryPath' already exists."
    }
    New-Item -ItemType Directory -Path $RepositoryPath | Out-Null
    Set-Location -Path $RepositoryPath
    git init
    Set-Location -Path (Get-Location -PSProvider FileSystem).ProviderPath
}