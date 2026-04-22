# Automation

This folder contains Microsoft Graph PowerShell scripts used to automate identity lifecycle tasks in the lab environment.

## Prerequisites

- PowerShell 7 or later recommended
- Microsoft Graph PowerShell SDK installed
- Sufficient permissions to manage users and groups in Microsoft Entra ID

## Install Microsoft Graph PowerShell

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force
```

## Connect to Microsoft Graph

```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"
```

## Scripts

- `connect-to-graph.ps1`
- `joiner-onboard-user.ps1`
- `mover-change-role.ps1`
- `leaver-offboard-user.ps1`

## Notes

Before running the scripts, update the `YOURTENANT.onmicrosoft.com` values to match your lab tenant.
