# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Set-Branch' {
    It 'Should checkout the specified branch' {
        Set-Branch -RepositoryPath 'path/to/repo' -BranchName 'feature-branch'
        $currentBranch = Get-CurrentBranch -RepositoryPath 'path/to/repo'
        $currentBranch | Should -Be 'feature-branch'
    }
    It 'Should throw an error if the repository path does not exist' {
        { Set-Branch -RepositoryPath 'invalid/path' -BranchName 'feature-branch' } | Should -Throw
    }
}