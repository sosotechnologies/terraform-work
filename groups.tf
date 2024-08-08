### eksAdminConsole group with its policies attachments

resource "aws_iam_group" "eks_admin_console" {
  name = "eksAdminConsole"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_cni_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_cluster_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_fargate_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_outpost_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSLocalOutpostClusterPolicy"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_service_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_vpc_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_iam_group_policy_attachment" "eks_admin_console_worker_policy" {
  group      = aws_iam_group.eks_admin_console.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


######
resource "aws_iam_group" "frontend_developer_group_one" {
  name = "photogrammetry-factory-frontenddevelopergroup-one"
}

resource "aws_iam_group" "frontend_developer_group_two" {
  name = "photogrammetry-factory-frontenddevelopergroup-two"
}

resource "aws_iam_group" "frontend_developer_group_three" {
  name = "photogrammetry-factory-frontenddevelopergroup-three"
}

resource "aws_iam_group" "frontend_developer_group_four" {
  name = "photogrammetry-factory-frontenddevelopergroup-four"
}

resource "aws_iam_group" "frontend_developer_group_five" {
  name = "photogrammetry-factory-frontenddevelopergroup-five"
}

resource "aws_iam_group" "user_frontend_developer_group" {
  name = "user-photogrammetry-factory-frontenddevelopergroup"
}
