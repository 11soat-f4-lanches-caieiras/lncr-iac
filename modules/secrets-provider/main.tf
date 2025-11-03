# Instalação do driver usando Helm
resource "helm_release" "secrets_store_csi_driver" {
  name             = "csi-secrets-store"
  namespace        = "kube-system"
  create_namespace = false
  repository       = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart            = "secrets-store-csi-driver"
  version          = "1.4.6"

  set {
    name  = "syncSecret.enabled"
    value = "true"
  }
}

resource "kubectl_manifest" "provider_aws_secret_service_account" {
  yaml_body = data.template_file.provider_aws_secret_service_account.rendered
}

resource "kubectl_manifest" "provider_aws_secret_cluster_role" {
  yaml_body = data.template_file.provider_aws_secret_cluster_role.rendered
}

resource "kubectl_manifest" "provider_aws_secret_cluster_role_binding" {
  yaml_body = data.template_file.provider_aws_secret_cluster_role_binding.rendered
}

resource "kubectl_manifest" "provider_aws_secret_daemon_set" {
  yaml_body = data.template_file.provider_aws_secret_daemon_set.rendered
}

# Service Account associada ao IAM Role
resource "kubectl_manifest" "service_account" {
  yaml_body = data.template_file.service_account.rendered
}

# Criação do IAM Role para o CSI Driver
resource "aws_iam_role" "csi_driver_role" {
  name = "${var.service_account_name}-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.oidc_provider
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${var.oidc_provider_id}:sub" = "system:serviceaccount:${var.namespace}:${var.service_account_name}"
            "${var.oidc_provider_id}:aud" = "sts.amazonaws.com"
          }
        }
      },
      {
        Effect = "Allow"
        Principal = {
          Federated = var.oidc_provider
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${var.oidc_provider_id}:sub" = "system:serviceaccount:${var.namespace}:kube-system"
            "${var.oidc_provider_id}:aud" = "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

# Política para acesso aos Secrets no Secrets Manager
resource "aws_iam_policy" "csi_secrets_policy" {
  name        = "${var.service_account_name}-secrets-policy"
  description = "Permissões para o CSI Driver acessar os Secrets"
  policy      = data.aws_iam_policy_document.csi_secrets_policy.json

  lifecycle {
    ignore_changes = [policy]
  }
}

# Associação da política ao IAM Role
resource "aws_iam_role_policy_attachment" "attach_csi_policy" {
  role       = aws_iam_role.csi_driver_role.name
  policy_arn = aws_iam_policy.csi_secrets_policy.arn
}