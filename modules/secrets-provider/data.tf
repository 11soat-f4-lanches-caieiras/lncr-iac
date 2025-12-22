data "template_file" "provider_aws_secret_service_account" {
  template = file("${path.module}/templates/provider-aws-sa.yaml")
}

data "template_file" "provider_aws_secret_cluster_role" {
  template = file("${path.module}/templates/cluster-role.yaml")
}

data "template_file" "provider_aws_secret_cluster_role_binding" {
  template = file("${path.module}/templates/cluster-role-binding.yaml")
}

data "template_file" "provider_aws_secret_daemon_set" {
  template = file("${path.module}/templates/daemon-set.yaml")
}

data "template_file" "service_account" {
  template = file("${path.module}/templates/service-account.yaml")

  vars = {
    service_account_name = var.service_account_name
    namespace            = var.namespace
    role_arn             = aws_iam_role.csi_driver_role.arn
  }
}

data "aws_iam_policy_document" "csi_secrets_policy" {
  statement {
    actions   = ["secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret"]
    resources = ["*"]
  }
}
