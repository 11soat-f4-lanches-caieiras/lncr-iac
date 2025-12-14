#========================================================================================#
#                                SECRETS MANAGER                                         #
#========================================================================================#

locals {
  app_secrets = {
    "lncr-ms-customer" = {
      MONGODB_URI = var.mongodb_uri
      LNCR_EXTERNAL_URL = var.customer_external_url
    }
    "lncr-ms-food-item" = {
      POSTGRES_URL = var.food_item_postgres_url
      POSTGRES_USER = var.food_item_postgres_user
      POSTGRES_PASSWORD = var.food_item_postgres_password
      LNCR_EXTERNAL_URL = var.food_item_external_url
    }
    "lncr-ms-kitchen-order" = {
      POSTGRES_URL = var.kitchen_order_postgres_url
      POSTGRES_USER = var.kitchen_order_postgres_user
      POSTGRES_PASSWORD = var.kitchen_order_postgres_password
    }
    "lncr-ms-notification" = {
      POSTGRES_URL = var.notification_postgres_url
      POSTGRES_USER = var.notification_postgres_user
      POSTGRES_PASSWORD = var.notification_postgres_password
    }
    "lncr-ms-payment" = {
      POSTGRES_URL = var.payment_postgres_url
      POSTGRES_USER = var.payment_postgres_user
      POSTGRES_PASSWORD = var.payment_postgres_password
      MERCADOPAGO_CLIENT_ID = var.mercadopago_client_id
      MERCADOPAGO_SECRET_ID = var.mercadopago_secret_id
      MERCADOPAGO_POS_ID = var.mercadopago_pos_id
      MERCADOPAGO_WEBHOOK_SECRET = var.mercadopago_webhook_secret
    }
    "lncr-ms-customer-order" = {
      POSTGRES_URL = var.customer_order_postgres_url
      POSTGRES_USER = var.customer_order_postgres_user
      POSTGRES_PASSWORD = var.customer_order_postgres_password
    }
    "lncr-ms-oauth" = {
      LNCR_OAUTH_SECRET_KEY = var.lncr_oauth_secret_key
      LNCR_OAUTH_ADMIN_CLIENT_ID = var.lncr_oauth_admin_client_id
      LNCR_OAUTH_ADMIN_CLIENT_SECRET = var.lncr_oauth_admin_client_secret
      LNCR_OAUTH_MONITOR_CLIENT_ID = var.lncr_oauth_monitor_client_id
      LNCR_OAUTH_MONITOR_CLIENT_SECRET = var.lncr_oauth_monitor_client_secret
      LNCR_OAUTH_TOTEM_CLIENT_ID = var.lncr_oauth_totem_client_id
      LNCR_OAUTH_TOTEM_CLIENT_SECRET = var.lncr_oauth_totem_client_secret
    }
  }
}

resource "aws_secretsmanager_secret" "app_secrets" {
  for_each = local.app_secrets
  
  name                    = "${each.key}-${var.environment_name}-secrets"
  description             = "Secrets for ${each.key} application"
  recovery_window_in_days = var.recovery_window_in_days
  kms_key_id              = var.kms_key_id

  tags = {
    Name        = "${each.key}-${var.environment_name}-secrets"
    Environment = var.environment_name
    Application = each.key
    Owner       = "Fiap"
    CostCenter  = "FinOps"
  }
}


resource "aws_secretsmanager_secret_version" "app_secrets" {
  for_each = local.app_secrets
  
  secret_id     = aws_secretsmanager_secret.app_secrets[each.key].id
  secret_string = jsonencode(each.value)
  
  lifecycle {
    ignore_changes = all
  }
}
