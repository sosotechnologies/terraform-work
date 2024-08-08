# VPC
resource "aws_vpc" "iwordee_production_vpc" {
  id = "vpc-07f142f1ec8861c27"
}

# Security Group for EKS Control Plane
resource "aws_security_group" "eks_control_plane" {
  name   = "eks-control-plane-sg"
  vpc_id = aws_vpc.iwordee_production_vpc.id
}

# EKS Cluster
resource "aws_eks_cluster" "iwordee_production" {
  name     = "IWordee-Production-sosotechboss"
  role_arn = "arn:aws:iam::368085106192:role/IWordee-Production-eks-master-role"

  vpc_config {
    subnet_ids         = ["subnet-0e5d32df8ccd54b06", "subnet-0b98338865df6807a"]
  }
}

# resource "aws_eks_cluster" "iwordee_production" {
#   name     = "IWordee-Production-sosotechboss"
#   role_arn = "arn:aws:iam::368085106192:role/IWordee-Production-eks-master-role"
#   vpc_config {
#     subnet_ids = ["subnet-0e5d32df8ccd54b06", "subnet-0b98338865df6807a"]
#   }
# }

# EKS Node Group
resource "aws_eks_node_group" "iwordee_production_ng_public" {
  cluster_name    = aws_eks_cluster.iwordee_production.name
  node_group_name = "IWordee-Production-eks-ng-public"
  node_role_arn   = "arn:aws:iam::368085106192:role/IWordee-Production-eks-nodegroup-role"
  subnet_ids      = ["subnet-0e5d32df8ccd54b06", "subnet-0b98338865df6807a"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }
}
