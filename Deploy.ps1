param(
    [string]$execMode,
    [string]$stackName,
    [string]$templateFile,
    [string]$parametersFile,    # Default value set to make it optional 
    [string]$awsRegion = "us-east-1"     # Default value set to make it optional 
)

# Validate parameters
if ($execMode -ne "deploy" -and $execMode -ne "delete" -and $execMode -ne "preview") {
    Write-Error "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview."
    exit 1
}

# Execute CloudFormation CLI
if ($execMode -eq "deploy") {
    aws cloudformation deploy `
        --stack-name $stackName `
        --template-file $templateFile `
        --parameter-overrides file://$parametersFile `
        --capabilities "CAPABILITY_NAMED_IAM" `
        --region $awsRegion
}

if ($execMode -eq "delete") {
    aws cloudformation delete-stack `
        --stack-name $stackName `
        --region $awsRegion
}

if ($execMode -eq "preview") {
    aws cloudformation deploy `
        --stack-name $stackName `
        --template-file $templateFile `
        --parameter-overrides file://$parametersFile `
        --capabilities "CAPABILITY_NAMED_IAM" `
        --no-execute-changeset `
        --region $awsRegion
}
