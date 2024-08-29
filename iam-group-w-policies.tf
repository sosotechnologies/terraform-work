############
# IAM users
############
# The IAM users (Aaron, Alain, Chris) are assumed to be already created.

#####################################################################################
# IAM group for superadmins with full Administrator access
#####################################################################################
module "iam_group_superadmins" {
  source = "../../modules/iam-group-with-policies"

  name = "superadmins"

  group_users = [
    module.iam_user_aaron.iam_user_name,
    module.iam_user_alain.iam_user_name,
    module.iam_user_chris.iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}

#####################################################################################
# IAM group for users with custom access
#####################################################################################
module "iam_group_with_custom_policies" {
  source = "../../modules/iam-group-with-policies"

  name = "custom"
  path = "/custom/"

  group_users = [
    module.iam_user_aaron.iam_user_name,
    module.iam_user_alain.iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly",
    "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess",
  ]

  custom_group_policies = [
    {
      name   = "AllowS3Listing"
      policy = data.aws_iam_policy_document.sample.json
    },
  ]
}

#####################################################################################
# IAM group for DevOps users
#####################################################################################
module "iam_group_devops" {
  source = "../../modules/iam-group-with-policies"

  name = "devops"
  path = "/devops/"

  group_users = [
    module.iam_user_chris.iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
  ]
}

######################
# IAM policy (sample)
######################
data "aws_iam_policy_document" "sample" {
  statement {
    actions = [
      "s3:ListBuckets",
    ]

    resources = ["*"]
  }
}
