function Build-Dotnet-Dev {
  $file = fzf -q ".csproj$"
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Development'
    dotnet build $file
  }
}

function Run-Dotnet-Dev {
  $file = fzf -q ".csproj$"
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Development'
    dotnet run --project $file
  }
}

function Watch-Dotnet-Dev {
  $file = fzf -q ".csproj$"
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Development'
    dotnet watch run --project $file
  }
}

function Build-Dotnet-Prod {
  $file = fzf -q ".csproj$"
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Production'
    dotnet build $file
  }
}

function Run-Dotnet-Prod {
  $file = fzf -q ".csproj$"
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Production'
    dotnet run --project $file
  }
}

function Watch-Dotnet-Prod {
  $file = fzf -q ".csproj$"
  if ($file) {
    $Env:ASPNETCORE_ENVIRONMENT='Production'
    dotnet watch run --project $file
  }
}
