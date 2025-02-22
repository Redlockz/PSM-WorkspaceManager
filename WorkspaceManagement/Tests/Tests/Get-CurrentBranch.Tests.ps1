# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Get-CurrentBranch' {
    It 'Should return the current branch name' {
        $result = Get-CurrentBranch -RepositoryPath 'path/to/repo'
        $result | Should -Be 'main'
    }
    It 'Should throw an error if the repository path does not exist' {
        { Get-CurrentBranch -RepositoryPath 'invalid/path' } | Should -Throw
    }
}