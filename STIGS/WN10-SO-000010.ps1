<#
.SYNOPSIS
    This PowerShell script ensures that the built-in guest account must be disabled.

.NOTES
    Author          : Stan Bucks
    LinkedIn        : linkedin.com/in/stan-bucks/
    GitHub          : github.com/StanBucks
    Date Created    : 2025-05-08
    Last Modified   : 2025-05-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000010

.TESTED ON
    Date(s) Tested  : 2025-05-08
    Tested By       : 2025-05-08
    Systems Tested  : Win10 VM (Azure)
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Check the status of the built-in Guest account
$guestAccount = Get-WmiObject -Class Win32_UserAccount -Filter "Name='Guest' AND LocalAccount=TRUE"

if ($null -eq $guestAccount) {
    Write-Output "Guest account not found on this system."
} else {
    if ($guestAccount.Disabled) {
        Write-Output "Compliant: Guest account is disabled."
    } else {
        Write-Output "Non-compliant: Guest account is enabled. Disabling now..."
        # Remediation: Disable the Guest account
        Disable-LocalUser -Name "Guest"
        Write-Output "Guest account has been disabled."
    }
}
