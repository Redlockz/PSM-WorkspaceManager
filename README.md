# PSM-WorkspaceManager

## Overview
The PSM-WorkspaceManager is a PowerShell module designed to manage workspaces effectively. It provides a set of functions to interact with Git repositories, allowing users to retrieve workspace details, update repositories, and manage branches seamlessly.

## Features
- **Get-Workspace**: Retrieve the current workspace details, including a list of repositories.
- **Update-Workspace**: Update all repositories in the workspace by pulling the latest changes.
- **Update-AllRepositoriesMain**: Update the main branch for all repositories by checking out the main branch and pulling the latest changes.
- **Get-MainBranch**: Retrieve the name of the main branch for the repository, typically 'main' or 'master'.
- **Set-CommitBranch**: Set the current branch to a specified branch name by checking it out.
- **Set-TemporaryStash**: Stash uncommitted changes temporarily using `git stash`.

## Functions

### Get-GitStrategy
Description: ...

### Get-CurrentBranch
Description: ...

### New-GitBranch
Description: ...

### New-GitBranchName
Description: ...

### New-Workspace
Description: ...

### Set-Workspace
Description: ...

### New-Repository
Description: ...

### Get-Repository
Description: ...

### Set-Repository
Description: ...

### Get-TemporaryBranch
Description: ...

### Get-GitBranch
Description: ...

## Installation
To install the PSM-WorkspaceManager module, clone the repository and import the module in your PowerShell session:

```powershell
Import-Module "path\to\PSM-WorkspaceManager\WorkspaceManagement\src\WorkspaceManagement.psm1"
```

## Usage
Each function can be called directly after importing the module. For example:

```powershell
Get-Workspace
Update-Workspace
```

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.


# Versioning

v0.0.1
- Repo created by AI Agent

v0.0.2
- Fixed bugs using AI Agent