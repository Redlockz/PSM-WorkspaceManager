# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Set-GitStrategy' {
    It 'Should set the merge strategy for the specified branch' {
        Set-GitStrategy -RepositoryPath 'path/to/repo' -BranchName 'feature-branch' -MergeStrategy 'merge'
        $gitConfig = Get-GitStrategy -RepositoryPath 'path/to/repo'
        $gitConfig | Should -Contain 'branch.feature-branch.merge merge'
    }
    It 'Should throw an error if the repository path does not exist' {
        { Set-GitStrategy -RepositoryPath 'invalid/path' -BranchName 'feature-branch' -MergeStrategy 'merge' } | Should -Throw
    }
}