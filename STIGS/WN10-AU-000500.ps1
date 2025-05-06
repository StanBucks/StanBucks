<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Stan Bucks
    LinkedIn        : linkedin.com/in/stanbucks/
    GitHub          : github.com/StanBucks
    Date Created    : 2025-05-01
    Last Modified   : 2024-05-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-05-06
    Tested By       : Stan Bucks
    Systems Tested  : Win10 VM (Azure)
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE

# Set the maximum size (in KB) for the Application event log
$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'
$maxSizeKB = 32768  # 0x00008000 in hex, which is 32,768 KB (32 MB)

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value
Set-ItemProperty -Path $regPath -Name 'MaxSize' -Value $maxSizeKB -Type DWord

Write-Host "Application event log max size set to $maxSizeKB KB."
