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
