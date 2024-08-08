# import the groups
```sh
terraform import aws_iam_group.eks_admin_console eksAdminConsole
terraform import aws_iam_group.frontend_developer_group_one photogrammetry-factory-frontenddevelopergroup-one
terraform import aws_iam_group.frontend_developer_group_two photogrammetry-factory-frontenddevelopergroup-two
terraform import aws_iam_group.frontend_developer_group_three photogrammetry-factory-frontenddevelopergroup-three
terraform import aws_iam_group.frontend_developer_group_four photogrammetry-factory-frontenddevelopergroup-four
terraform import aws_iam_group.frontend_developer_group_five photogrammetry-factory-frontenddevelopergroup-five
terraform import aws_iam_group.user_frontend_developer_group user-photogrammetry-factory-frontenddevelopergroup
```

## import the eks policies for eksAdminConsole
```sh
terraform import aws_iam_group_policy_attachment.eks_admin_console_cluster_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
terraform import aws_iam_group_policy_attachment.eks_admin_console_cni_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
terraform import aws_iam_group_policy_attachment.eks_admin_console_fargate_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy
terraform import aws_iam_group_policy_attachment.eks_admin_console_outpost_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKSLocalOutpostClusterPolicy
terraform import aws_iam_group_policy_attachment.eks_admin_console_service_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKSServicePolicy
terraform import aws_iam_group_policy_attachment.eks_admin_console_vpc_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKSVPCResourceController
terraform import aws_iam_group_policy_attachment.eks_admin_console_worker_policy eksAdminConsole/arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
```

### run terraform plan
```sh
terraform plan
```

### run terraform refresh sometimes if state is stale
```sh
terraform refresh
```

## import the eks policies forphotogrammetry-factory-frontenddevelopergroup-one

## If you get these errors:
Error: Resource already managed by Terraform
│ 
│ Terraform is already managing a remote object for aws_iam_group.eks_admin_console. To import to this address you must first remove the existing object from the state.

RUN COMMAND:

```sh
terraform state rm aws_iam_group.eks_admin_console
```

## Adding users to groups like this instruction
### Now I have 4 existing users already in the console that I want to add them to these groups as stated:
macaz1@gmail.com  --> add to groups eksAdminConsole and photogrammetry-factory-frontenddevelopergroup-one


macaz2@gmail.com --> add to groups eksAdminConsole , photogrammetry-factory-frontenddevelopergroup-one and photogrammetry-factory-frontenddevelopergroup-two

macaz3@gmail.com --> add to groups eksAdminConsole , photogrammetry-factory-frontenddevelopergroup-one
macaz4@gmail.com  --> add to groups eksAdminConsole 
 
### here is how it should be done:
```yaml
resource "aws_iam_user_group_membership" "macaz1_groups" {
  user = "macaz1@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name
  ]
}

resource "aws_iam_user_group_membership" "macaz2_groups" {
  user = "macaz2@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
    aws_iam_group.frontend_developer_group_two.name
  ]
}

resource "aws_iam_user_group_membership" "macaz3_groups" {
  user = "macaz3@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name
  ]
}

resource "aws_iam_user_group_membership" "macaz4_groups" {
  user = "macaz4@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name
  ]
}

```

### now import 
```sh
terraform import aws_iam_user_group_membership.macaz1_group macaz1@gmail.com/eksAdminConsole/photogrammetry-factory-frontenddevelopergroup-one
terraform import aws_iam_user_group_membership.macaz2_group macaz2@gmail.com/eksAdminConsole/photogrammetry-factory-frontenddevelopergroup-one/photogrammetry-factory-frontenddevelopergroup-two
terraform import aws_iam_user_group_membership.macaz3_group macaz3@gmail.com/eksAdminConsole/photogrammetry-factory-frontenddevelopergroup-one
terraform import aws_iam_user_group_membership.macaz4_group macaz4@gmail.com/eksAdminConsole

```

### Refresh again
```sh
terraform refresh
```

### Create new users and add


### Import the EKS cluster
```sh
terraform import aws_vpc.iwordee_production_vpc vpc-07f142f1ec8861c27
terraform import aws_security_group.eks_control_plane sg-0edcad46362bb5fb3


aws eks describe-cluster --name IWordee-Production-sosotechboss --region us-east-1
terraform init -upgrade

terraform import aws_eks_cluster.iwordee_production arn:aws:eks:us-east-1:368085106192:cluster/IWordee-Production-sosotechboss
[OR] TF_LOG=DEBUG terraform import aws_eks_cluster.iwordee_production arn:aws:eks:us-east-1:368085106192:cluster/IWordee-Production-sosotechboss

terraform state list
```
