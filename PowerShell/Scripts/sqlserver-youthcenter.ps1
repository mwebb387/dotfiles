$YCDBBackupFolder = 'C:\temp\'

function Check-SqlServerModule($SqlServerCmdlet) {
  if (!(Get-Command $SqlServerCmdlet -errorAction SilentlyContinue -CommandType Cmdlet)) {
    Write-Host "Sql Server module may not be installed. Type 'Install-Module -Name SqlServer' then try again"
    return $False
  }

  return $True
}

function Backup-YouthCenter($BackupName = 'yc') {
  if (!(Check-SqlServerModule 'Backup-SqlDatabase')) {
    return
  }

  Backup-SqlDatabase -ServerInstance 'localhost' -Database 'YouthCenter_Local' -BackupFile "$YCDBBackupFolder$BackupName.bak" -CopyOnly
}

function Invoke-YouthCenterSql($Sql, $DoFormat = $False) {
  if (!$Sql) {
    Write-Host 'Please enter some SQL'
    return
  }

  $Output = Invoke-Sqlcmd -Query $Sql -ServerInstance 'localhost' -Database 'YouthCenter_Local' -TrustServerCertificate

  if ($DoFormat) {
    $Output | Format-Table -auto
  } else {
    $Output
  }
}

function Invoke-YouthCenterSqlFile($SqlFile, $DoFormat = $False) {
  if (!$Sql) {
    Write-Host 'Please enter the name of a SQL file'
    return
  }

  $Output = Invoke-Sqlcmd -InputFile $SqlFile -ServerInstance 'localhost' -Database 'YouthCenter_Local' -TrustServerCertificate

  if ($DoFormat) {
    $Output | Format-Table -auto
  } else {
    $Output
  }
}

function Restore-YouthCenter($BackupName = 'yc') {
  if (!(Check-SqlServerModule 'Restore-SqlDatabase')) {
    return
  }

  Restore-SqlDatabase -ServerInstance 'localhost' -Database 'YouthCenter_Local' -BackupFile "$YCDBBackupFolder$BackupName.bak" -ReplaceDatabase -Confirm
}
