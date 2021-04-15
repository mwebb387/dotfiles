$Env:JIRA_API_TOKEN="GPzhzdUsjOzJz8Pvkzwj22F0"

$query = "resolution = unresolved and status != 'Done' and status != 'Ready to Deploy' and status != 'On Client Environment' and assignee=currentuser() ORDER BY issue, priority asc, created"

function Build-JiraQuery {
  param(
    [String] $Project = "",
    [Bool] $ShowAll = $False
  )

  $qProject = ""
  $qStatus = ""

  if ($Project) {
    $qProject = "and project = $Project"
  }

  if (-Not $ShowAll) {
    $qStatus = "and status != 'Done' and status != 'Ready to Deploy' and status != 'On Client Environment'"
  }

  return "resolution = unresolved $qProject $qStatus and assignee=currentuser() ORDER BY issue, priority asc, created"
}

function Get-JiraIssues {
  jira list --query $query | ForEach-Object -Process { $_.SubString(0, $_.IndexOf(":"))  }
}

function Get-JiraProjects {
  jira list --query $query | ForEach-Object -Process { $_.SubString(0, $_.IndexOf("-"))  } | Get-Unique
}

function Show-JiraIssues {
  param(
    $ShowAll = $False
  )

  jira list --template table --query (Build-JiraQuery -ShowAll $ShowAll)
}

function Show-JiraIssuesByProject {
  [CmdletBinding()]
  param()
  DynamicParam {
    # Set the dynamic parameters' name
    $ParameterName = 'Project'

    # Create the dictionary
    $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

    # Create the collection of attributes
    $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]

    # Create and set the parameters' attributes
    $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute.Mandatory = $True
    $ParameterAttribute.Position = 0

    # Add the attributes to the attributes collection
    $AttributeCollection.Add($ParameterAttribute)

    # Generate and set the ValidateSet
    $arrSet = Get-JiraProjects
    $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)

    # Add the ValidateSet to the attributes collection
    $AttributeCollection.Add($ValidateSetAttribute)

    # Create and return the dynamic parameter
    $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
    $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
    return $RuntimeParameterDictionary
  }

  begin {
    $Project = $PsBoundParameters[$ParameterName]
  }

  process {
    jira list --template table --query (Build-JiraQuery -Project $Project)
  }
}

function View-JiraIssue {
  [CmdletBinding()]
  Param()
  DynamicParam {
    # Set the dynamic parameters' name
    $ParameterName = 'Issue'

    # Create the dictionary
    $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

    # Create the collection of attributes
    $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]

    # Create and set the parameters' attributes
    $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute.Mandatory = $true
    $ParameterAttribute.Position = 0

    # Add the attributes to the attributes collection
    $AttributeCollection.Add($ParameterAttribute)

    # Generate and set the ValidateSet
    $arrSet = Get-JiraIssues
    $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)

    # Add the ValidateSet to the attributes collection
    $AttributeCollection.Add($ValidateSetAttribute)

    # Create and return the dynamic parameter
    $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
    $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
    return $RuntimeParameterDictionary
  }

  begin {
    $Issue = $PsBoundParameters[$ParameterName]
  }

  process {
    jira view $Issue
  }
}

function Move-JiraIssueToQA {
  [CmdletBinding()]
  Param()
  DynamicParam {
    # Set the dynamic parameters' name
    $ParameterName = 'Issue'

    # Create the dictionary
    $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

    # Create the collection of attributes
    $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]

    # Create and set the parameters' attributes
    $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute.Mandatory = $True
    $ParameterAttribute.Position = 0

    # Add the attributes to the attributes collection
    $AttributeCollection.Add($ParameterAttribute)

    # Generate and set the ValidateSet
    $arrSet = Get-JiraIssues
    $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)

    # Add the ValidateSet to the attributes collection
    $AttributeCollection.Add($ValidateSetAttribute)

    # Create and return the dynamic parameter
    $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
    $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
    return $RuntimeParameterDictionary
  }

  begin {
    $Issue = $PsBoundParameters[$ParameterName]
  }

  process {
    jira transition "Ready for QA" $Issue
  }
}
