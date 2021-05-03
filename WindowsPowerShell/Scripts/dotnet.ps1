function Build-Dotnet-Dev {
  $Env:ASPNETCORE_ENVIRONMENT='Development'
  $file = fzf -q ".csproj$"
  dotnet build $file
}

function Run-Dotnet-Dev {
  $Env:ASPNETCORE_ENVIRONMENT='Development'
  $file = fzf -q ".csproj$"
  dotnet run --project $file
}

function Watch-Dotnet-Dev {
  $Env:ASPNETCORE_ENVIRONMENT='Development'
  $file = fzf -q ".csproj$"
  dotnet watch run --project $file
}

function Build-Dotnet-Prod {
  $Env:ASPNETCORE_ENVIRONMENT='Production'
  $file = fzf -q ".csproj$"
  dotnet build $file
}

function Run-Dotnet-Prod {
  $Env:ASPNETCORE_ENVIRONMENT='Production'
  $file = fzf -q ".csproj$"
  dotnet run --project $file
}

function Watch-Dotnet-Prod {
  $Env:ASPNETCORE_ENVIRONMENT='Production'
  $file = fzf -q ".csproj$"
  dotnet watch run --project $file
}
