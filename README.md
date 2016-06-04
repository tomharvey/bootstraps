# Bootstraps

Scripts to aid in bootstrapping instances.

## Usage
*Targets Ubuntu*

The brave can pipe the raw shell scripts from github to bash by adding the following to their cloud-init user data:

`\curl -sSL https://raw.githubusercontent.com/tomharvey/bootstraps/master/$SCRIPT_NAME.sh | bash`

[But there are lots of smart people who will tell you not to trust this method](https://jordaneldredge.com/blog/one-way-curl-pipe-sh-install-scripts-can-be-dangerous/)


## Descriptions

### cfn-bootstrap-install
Installs latest CloudFormation tools for ubuntu. AWS maintain .rpm packages, but no .debs. This will make cloud-init user scripts a lot shorter and easier to repeat.

### codedeploy-agent-install
Installs the latest CodeDeploy agent.

### s3-tools-install
Installs the Amazon S3 Tools from the [s3tools repo installation guide](http://s3tools.org/repositories#note-deb)
