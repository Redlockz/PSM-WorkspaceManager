param()
Set-StrictMode -Version "Latest" 
$ErrorActionPreference = "Stop"

BeforeAll {
    $scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
    $modulePath = Join-Path -Path $scriptDir -ChildPath '../../../PSM-WorkspaceManager.psm1'
    Import-Module -Name $modulePath -Force
}

Describe "Get-Workspace" {
    It "should return a list of repositories" {
        $result = Get-Workspace -Path "test"
        $result | Should -BeOfType "System.Array"
    }
}