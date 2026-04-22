# LEAVER: Disable a user and remove all group memberships

param(
    [string]$UserPrincipalName = "david.chen@YOURTENANT.onmicrosoft.com"
)

$user = Get-MgUser -Filter "userPrincipalName eq '$UserPrincipalName'"

if (-not $user) {
    Write-Error "User not found."
    exit
}

# Disable the account
Update-MgUser -UserId $user.Id -AccountEnabled:$false

# Get group memberships
$memberships = Get-MgUserMemberOf -UserId $user.Id -All

foreach ($membership in $memberships) {
    if ($membership.AdditionalProperties["@odata.type"] -eq "#microsoft.graph.group") {
        Remove-MgGroupMemberByRef -GroupId $membership.Id -DirectoryObjectId $user.Id
        Write-Host "Removed from group ID: $($membership.Id)"
    }
}

Write-Host "Disabled $UserPrincipalName and removed group memberships."
