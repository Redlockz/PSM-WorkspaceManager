@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'PSM-WorkspaceManager.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # ID used to uniquely identify this module
    GUID = 'd9b2d7e1-5b2e-4b2e-8b2e-4b2e8b2e4b2e'

    # Author of this module
    Author = 'Your Name'

    # Company or vendor of this module
    CompanyName = 'Your Company'

    # Copyright statement for this module
    Copyright = 'MIT Licensed'

    # Description of the functionality provided by this module
    Description = 'This is a sample module manifest file.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Name of the Windows PowerShell host required by this module
    PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    PowerShellHostVersion = ''

    # Minimum version of the .NET Framework required by this module
    DotNetFrameworkVersion = '4.5'

    # Minimum version of the common language runtime (CLR) required by this module
    CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module
    ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @('Get-CurrentBranch', 'Get-GitStrategy', 'Get-MainBranch', 'Get-RepositoryStatus', 'Get-TemporaryStash', 'Get-Workspace', 'New-Branch', 'New-Repository', 'Set-Branch', 'Set-CommitBranch', 'Set-GitStrategy', 'Set-TemporaryStash', 'Update-AllRepositoriesMain', 'Update-OriginRepository', 'Update-Workspace')

    # Cmdlets to export from this module
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport = @()

    # DSC resources to export from this module
    DscResourcesToExport = @()

    # List of all modules packaged with this module
    ModuleList = @()

    # List of all files packaged with this module
    FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData = @{}

    # HelpInfo URI of this module
    HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    DefaultCommandPrefix = ''
}

