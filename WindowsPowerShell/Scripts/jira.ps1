$Env:JIRA_API_TOKEN=(Get-Pass 'jira')

$query = "resolution = unresolved and status != 'Done' and status != 'Ready to Deploy' and status != 'On Client Environment' and assignee=currentuser() ORDER BY issue, priority asc, created"

function Build-JiraQuery {
  param(
    [String] $Project = "",
    [Bool] $ShowAll = $False,
    [Bool] $AllUsers = $False
  )

  $qProject = ""
  $qStatus = ""
  $qUser = ""

  if ($Project) {
    $qProject = "and project = $Project"
  }

  if (-Not $ShowAll) {
    $qStatus = "and status != 'Done' and status != 'Ready to Deploy' and status != 'On Client Environment'"
  }

  if (-Not $AllUsers) {
    $qUser = "and assignee=currentuser()"
  }

  return "resolution = unresolved $qProject $qStatus $qUser ORDER BY issue, priority asc, created"
}

function Jira-ListIssues {
  jira list --query $query | ForEach-Object -Process {
    if ($_) {
      $_.SubString(0, $_.IndexOf(":"))
    } else {
      $_
    }
  }
}

function Jira-ListProjects {
  jira list --query $query | ForEach-Object -Process {
    if ($_) {
      $_.SubString(0, $_.IndexOf("-"))
    } else {
      $_
    }
  } | Get-Unique
}

function Jira-OpenProject {
  $Project = Jira-ListProjects | fzf
  if ($Project) {
    C:\Progra~2\Google\Chrome\Application\chrome.exe "https://bizstream.atlassian.net/browse/$Project"
  }
}

function Jira-OpenIssue {
  $Issue = Jira-ListIssues | fzf
  if ($Issue) {
    C:\Progra~2\Google\Chrome\Application\chrome.exe "https://bizstream.atlassian.net/browse/$Issue"
  }
}

function Jira-ShowIssues {
  param(
    $ShowAll = $False,
    $AllUsers = $False
  )

  jira list --template table --query (Build-JiraQuery -ShowAll $ShowAll -AllUsers $AllUsers)
}

function Jira-ShowProjectIssues {
  param(
    $ShowAll = $False,
    $AllUsers = $False
  )

  $Project = Jira-ListProjects | fzf
  jira list --template table --query (Build-JiraQuery -Project $Project -ShowAll $ShowAll -AllUsers $AllUsers)
}

function Jira-ViewIssue {
  $Issue = Jira-ListIssues | fzf
  jira view $Issue
}

function Jira-MoveIssueToQA {
  $Issue = Jira-ListIssues | fzf
  jira transition "Ready for QA" $Issue
}
