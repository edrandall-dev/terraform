This is a fairly simple setup in terraform which creates the following:
 - A Single VPC
 - Two Subnets
 - A custom security group
 - Two EC2 instances
 - Three VPC Endpoints (Interface Endpoints) to allow communication with SSM over PrivateLink
 - An IAM role to allow the instances to be managed by SSM

