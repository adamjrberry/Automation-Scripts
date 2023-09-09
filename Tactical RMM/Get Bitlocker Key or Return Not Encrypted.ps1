$recoverykey = (Get-BitLockerVolume -MountPoint C).KeyProtector.RecoveryPassword
if ($recoverykey -gt 0)
  {
  "$recoverykey"
  }
else
{
"Drive not encrypted"
}  
