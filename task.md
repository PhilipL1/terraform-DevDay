Create VPC, Subnets, etc (to host the autoscaling group) - done
Configure Security Groups to ensure access is only granted on port 80 - done
Create an instance on our subnets using an module
Deploy an autoscaling group of EC2 instances hosting a simple webpage
Deploy an application load balancer
Store terraform state in a remote backend (Terraform Cloud, S3, Consul)
Please push your code to internal ECS Bitbucket (Private Repo).

modules - https://www.terraform.io/docs/language/meta-arguments/module-providers.html
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

aws ami - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

internet gateway - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
