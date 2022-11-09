$TmUrl = "https://app.tmetric.com/api/v3/accounts"

function Tmetric-ReadConfig($ConfigFile = "tmconfig.json") {
  return Get-Content "tmconfig.json" | ConvertFrom-Json
}

function Tmetric-CreateUrl($Config) {
  return "$TmUrl/$($Config.accountId)"
}

function Tmetric-GetRequest($Endpoint, $Config) {
  #TODO: Headers
  $Url = "$(Tmetric-CreateUrl($Config))/$Endpoint"
  return Invoke-WebRequest -Uri $Url
}

function Tmetric-GetTimeEntries($StartDate, $EndDate) {
  $config = Tmetric-ReadConfig()
  $endpoint = "timeentries?userId=$($config.userId)&startDate=$StartDate&endDate=$EndDate"
    return Tmetric-GetRequest($endpoint, $config)
}


