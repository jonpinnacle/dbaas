Function Set-SmartScreenSettingsStatus
{
  [CmdletBinding()]
  Param (
    [Parameter(Mandatory)]
    [ValidateSet("Off", "Prompt", "RequireAdmin")]
    [system.String]$State
  )
  Begin
  {
    # Make sure we run as admin                        
    $usercontext = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
    $IsAdmin = $usercontext.IsInRole(544)
    if (-not ($IsAdmin))
    {
      Write-Warning "Must run powerShell as Administrator to perform these actions"
      break
    }
    
  }
  Process
  {
    try
    {
      Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name SmartScreenEnabled -ErrorAction Stop -Value $State -Force
    }
    catch
    {
      Write-Warning -Message "Failed to write registry value because $($_.Exception.Message)"
    }
  }
  End { }
} 
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

 Set-ExecutionPolicy Unrestricted -Force
 Set-SmartScreenSettingsStatus -State Prompt