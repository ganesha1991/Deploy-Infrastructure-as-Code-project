# Infrastructure as Code Project Solution
### Submitted by : Ganesh Kumar Selva Thirupathi 

deploy.sh : This script is used to deploy, delete and preview this project - It accepts the below parameters

Execution mode, stack name, template file, parameters file, Region (optional)


`architecture-diagram.jpg`: architecture diagram of this project.

`index.html`: This is main html file of application.

`network-params.json`: Parameters file for network cloud formation stack.

`network.yml`: CloudFormation template for creating networking resources for this project.

`servers-params.json`: Parameters file for servers cloud formation stack.

`servers.yml`: CloudFormation template for creating servers for this project.



## Spin up instructions
use Deploy.sh bash script using deploy option to spin up the network stack first and followed by the servers stack

use deploy option - ./deploy.sh deploy <stack-name> <template-file> <parameter-file> <region>

(the stack is already up and running )

`gk-udagram-demo-s3-bucket` - is the S3 bucket created and hosted the html file there. 
## Outputs
Outputs of the Network stack are the VPC ID, public subnets, private subnets and the routing tables
Outputs for the server stack is the Loadbalancer DNS name with HTTP prefixed.

Final output: http://gk-dem-webap-s4tlqovy08rd-2111062416.us-east-1.elb.amazonaws.com

## Tear down instructions
use Deploy.sh bash script using the delete option to tear down the server stack first and followed by the network stack

use deploy option - ./deploy.sh deploy <stack-name> <template-file> <parameter-file> <region>

## Other considerations
If using powershell terminal, use the Deploy.ps1 script to spinup or teardown the stack
