# Bootstraps

Scripts to aid in bootstrapping instances.

## Usage
**Targets Ubuntu**
The brave can pipe the raw shell scripts from github to bash:
`\curl -sSL https://raw.githubusercontent.com/tomharvey/bootstraps/master/$SCRIPT_NAME.sh | bash`
so you can add that line to your cloud-init user data.

## Descriptions

### cfn-bootstrap-install
Installs latest CloudFormation tools for ubuntu. AWS maintain .rpm packages, but no .debs. This will make cloud-init user scripts a lot shorter and easier to repeat.

### codedeploy-agent-install
Installs the latest CodeDeploy agent.
