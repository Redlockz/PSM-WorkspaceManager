# Import the module
Import-Module -Name 'PSM-WorkspaceManager'

Describe 'Set-TemporaryStash' {
    It 'Should stash uncommitted changes' {
        Set-TemporaryStash -Path 'path/to/repo'
        $stashList = git stash list
        $stashList | Should -Contain 'Temporary stash by Set-TemporaryStash function'
    }
    It 'Should throw an error if the path is not a git repository' {
        { Set-TemporaryStash -Path 'invalid/path' } | Should -Throw
    }


function Test-SetTemporaryStash {
    # Arrange
    $expectedResult = "Temporary stash set"
    
    # Act
    $result = Set-TemporaryStash "test-stash"

    # Assert
    if ($result -ne $expectedResult) {
            throw "Test failed: Expected '$expectedResult' but got '$result'"
        }
}

function Test-SetTemporaryStash_InvalidInput {
    # Arrange
    $invalidInput = $null

    # Act
    try {
        Set-TemporaryStash $invalidInput
        throw "Test failed: Expected an error for invalid input"
    } catch {
        # Assert
        if ($_.Exception.Message -ne "Invalid input") {
            throw "Test failed: Expected 'Invalid input' error but got '$($_.Exception.Message)'"
        }
    }
}

Test-SetTemporaryStash
Test-SetTemporaryStash_InvalidInput