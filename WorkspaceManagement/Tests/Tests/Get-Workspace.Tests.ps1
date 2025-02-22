# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

BeforeAll {
    # Import the module under test
    Import-Module -Name PSM-WorkspaceManager
}

Describe "Get-Workspace" {
    It "should return the correct workspace for a valid name" {
        $result = Get-Workspace -workspaceName "TestWorkspace"
        $result | Should -Be "ExpectedWorkspace"
    }

    It "should return $null for an invalid workspace name" {
        $result = Get-Workspace -workspaceName "InvalidWorkspace"
        $result | Should -Be $null
    }

    It "should handle empty workspace name" {
        $result = Get-Workspace -workspaceName ""
        $result | Should -Be $null
    }

    It "should throw an error for null workspace name" {
        { Get-Workspace -workspaceName $null } | Should -Throw
    }

    It 'Should return the list of repositories in the workspace' {
        $result = Get-Workspace -Path 'path/to/workspace'
        $result | Should -Not -BeNullOrEmpty
    }

    It 'Should return an empty list if no repositories are found' {
        $result = Get-Workspace -Path 'empty/workspace'
        $result | Should -BeNullOrEmpty
    }
}