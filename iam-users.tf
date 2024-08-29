module "iam_user_aaron" {
  source = "../../modules/iam-user"

  create_user               = true
  create_iam_user_login_profile = true
  create_iam_access_key     = true
  name                      = "aaron.collins@gmail.com"
  path                      = "/"
  force_destroy             = false
  pgp_key                   = ""
  iam_access_key_status     = "Active"
  password_reset_required   = true
  password_length           = 20
  upload_iam_user_ssh_key   = false
  ssh_key_encoding          = "SSH"
  ssh_public_key            = ""
  permissions_boundary      = ""
  policy_arns               = []
  tags                      = {
    "Owner" = "Frontend"
  }
}

module "iam_user_alain" {
  source = "../../modules/iam-user"

  create_user               = true
  create_iam_user_login_profile = true
  create_iam_access_key     = true
  name                      = "alain.lens@gmail.com"
  path                      = "/"
  force_destroy             = false
  pgp_key                   = ""
  iam_access_key_status     = "Active"
  password_reset_required   = true
  password_length           = 20
  upload_iam_user_ssh_key   = false
  ssh_key_encoding          = "SSH"
  ssh_public_key            = ""
  permissions_boundary      = ""
  policy_arns               = []
  tags                      = {
    "Owner" = "Administration"
  }
}

##  without secret
module "iam_user_chris" {
  source = "../../modules/iam-user"

  create_user               = true
  create_iam_user_login_profile = true
  create_iam_access_key     = false  # No access keys
  name                      = "chris.brown@gmail.com"
  path                      = "/"
  force_destroy             = false
  password_reset_required   = true
  password_length           = 20
  upload_iam_user_ssh_key   = false
  ssh_key_encoding          = "SSH"
  ssh_public_key            = ""
  permissions_boundary      = ""
  policy_arns               = []
  tags                      = {
    "Owner" = "DevOps"
  }
}
