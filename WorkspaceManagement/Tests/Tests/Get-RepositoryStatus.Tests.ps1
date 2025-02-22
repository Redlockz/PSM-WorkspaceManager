# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Get-RepositoryStatus' {
    It 'Should return the repository status' {
        $result = Get-RepositoryStatus -RepositoryPath 'path/to/repo'
        $result | Should -Not -BeNullOrEmpty
    }
    It 'Should throw an error if the repository path does not exist' {
        { Get-RepositoryStatus -RepositoryPath 'invalid/path' } | Should -Throw
    }
}