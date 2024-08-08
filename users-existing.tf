resource "aws_iam_user_group_membership" "macaz1_group" {
  user = "macaz1@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
  ]
}

resource "aws_iam_user_group_membership" "macaz2_group" {
  user = "macaz2@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
    aws_iam_group.frontend_developer_group_two.name,
  ]
}

resource "aws_iam_user_group_membership" "macaz3_group" {
  user = "macaz3@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
  ]
}

resource "aws_iam_user_group_membership" "macaz4_group" {
  user = "macaz4@gmail.com"

  groups = [
    aws_iam_group.eks_admin_console.name,
  ]
}
