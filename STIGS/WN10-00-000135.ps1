<#
.SYNOPSIS
    This PowerShell script ensures that the host-based firewall is installed and enabled on the system.

.NOTES
    Author          : Stan Bucks
    LinkedIn        : linkedin.com/in/stanbucks/
    GitHub          : github.com/StanBucks
    Date Created    : 2025-05-06
    Last Modified   : 2024-05-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000135

.TESTED ON
    Date(s) Tested  : 2025-05-06
    Tested By       : Stan Bucks
    Systems Tested  : Win10 VM (Azure)
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-00-000135).ps1 
#>

# Check the status of all firewall profiles
$profiles = Get-NetFirewallProfile

$disabledProfiles = $profiles | Where-Object { $_.Enabled -eq $false }

if ($disabledProfiles) {
    Write-Host "One or more firewall profiles are disabled. Enabling all profiles..."
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    Write-Host "Firewall has been enabled for all profiles."
} else {
    Write-Host "Firewall is already enabled for all profiles."
}
