function Get-Workspace {
    param (
        [string]$Path = (Get-Location)
    )

    # Check for VSCode workspace file
    $workspaceFile = Get-ChildItem -Path $Path -Filter "*.code-workspace" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1

    # Check for PyCharm workspace file
    if ($null -eq $workspaceFile) {
        $workspaceFile = Get-ChildItem -Path $Path -Filter "*.idea" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
    }

    # If no specific workspace file is found, assume the path contains multiple repositories
    if ($null -eq $workspaceFile) {
        $repositories = Get-ChildItem -Path $Path -Directory | Where-Object { Test-Path "$($_.FullName)\.git" }
        return $repositories.FullName
    }

    # Read the workspace file
    $workspaceContent = Get-Content -Path $workspaceFile.FullName -Raw | ConvertFrom-Json

    # Extract the list of repositories (folders) in the workspace
    $repositories = $workspaceContent.folders | ForEach-Object { $_.path } | Where-Object { Test-Path "$($_)\.git" }

    # Return the list of repositories
    return $repositories
}