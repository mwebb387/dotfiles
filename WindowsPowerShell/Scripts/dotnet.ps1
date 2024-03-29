function Dotnet-Build-Dev {
  $file = fd .csproj | fzf
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Development'
    dotnet build $file
  }
}

function Dotnet-Run-Dev {
  $file = fd .csproj | fzf
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Development'
    dotnet run --project $file
  }
}

function Dotnet-Watch-Dev {
  $file = fd .csproj | fzf
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Development'
    dotnet watch run --project $file
  }
}

function Dotnet-Build-Prod {
  $file = fd .csproj | fzf
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Production'
    dotnet build $file
  }
}

function Dotnet-Run-Prod {
  $file = fd .csproj | fzf
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Production'
    dotnet run --project $file
  }
}

function Dotnet-Watch-Prod {
  $file = fd .csproj | fzf
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Production'
    dotnet watch run --project $file
  }
}

Set-Alias -Name dbdev -Value Dotnet-Build-Dev
Set-Alias -Name drdev -Value Dotnet-Run-Dev
Set-Alias -Name dwdev -Value Dotnet-Watch-Dev
Set-Alias -Name dbprod -Value Dotnet-Build-Dev
Set-Alias -Name drprod -Value Dotnet-Run-Prod
Set-Alias -Name dwprod -Value Dotnet-Watch-Prod

