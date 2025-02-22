# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Get-MainBranch' {
    It 'Should return the main branch name' {
        $result = Get-MainBranch -Path 'path/to/repo'
        $result | Should -Be 'main'
    }
    It 'Should throw an error if the path is not a Git repository' {
        { Get-MainBranch -Path 'invalid/path' } | Should -Throw
    }
    It 'should handle cases where no branches exist' {
        # Simulate no branches
        Mock Get-Branches { @() }
        $result = Get-MainBranch
        $expected = $null
        $result | Should -Be $expected
    }
}