# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Get-TemporaryStash' {
    It 'should return the stash list for the specified branch' {
        param (
            [string]$BranchName = 'feature/test-branch'
        )

        # Mock the Get-Workspace function
        Mock Get-Workspace { return 'C:/path/to/repo' }

        # Mock the git command
        Mock git { return 'stash@{0}: WIP on feature/test-branch: 1234567 Commit message' }

        $result = Get-TemporaryStash -BranchName $BranchName

        $result | Should -Contain 'stash@{0}: WIP on feature/test-branch: 1234567 Commit message'
    }
}