<#
.SYNOPSIS
    This PowerShell script denies users the ability to automatically store passwords as part of their remote desktop connection.

.NOTES
    Author          : Stan Bucks
    LinkedIn        : linkedin.com/in/stan-bucks/
    GitHub          : github.com/StanBucks
    Date Created    : 2025-05-07
    Last Modified   : 2025-05-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000280

.TESTED ON
    Date(s) Tested  : 2025-05-07
    Tested By       : 2025-05-07
    Systems Tested  : Win10 VM (Azure)
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE# PowerShell script to configure STIG ID: WN10-CC-000280

$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
$valueName = 'fPromptForPassword'
$valueData = 1

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $valueData -Type DWord
