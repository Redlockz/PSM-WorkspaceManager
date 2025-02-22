# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Get-GitStrategy' {
    It 'Should return the git strategy configuration' {
        $result = Get-GitStrategy -RepositoryPath 'path/to/repo'
        $result | Should -Not -BeNullOrEmpty
    }
    It 'Should throw an error if the repository path does not exist' {
        { Get-GitStrategy -RepositoryPath 'invalid/path' } | Should -Throw
    }
}