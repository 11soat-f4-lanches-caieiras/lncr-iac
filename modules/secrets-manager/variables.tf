#========================================================================================#
#                                 CUSTOMER VARIABLES                                     #
#========================================================================================#

variable "prefix_name" {
  description = "Prefix for resource names"
  type        = string
}

variable "environment_name" {
  type        = string
  description = "Environment name where Secrets Manager will be provisioned. Allowed values: [prd | stg | qa | dev | labs | payer | devops]"
  validation {
    condition     = contains(["prd", "stg", "qa", "dev", "labs", "payer", "devops"], var.environment_name)
    error_message = "Value must be 'prd', 'stg', 'qa', 'dev' or 'labs'."
  }
}

#========================================================================================#
#                              SECRETS MANAGER VARIABLES                                #
#========================================================================================#

variable "recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
  type        = number
  default     = 7
}

variable "kms_key_id" {
  description = "KMS key ID to encrypt the secret"
  type        = string
  default     = null
}

#========================================================================================#
#                              APPLICATION SECRETS VARIABLES                           #
#========================================================================================#

# External URL variables for each application
variable "customer_external_url" {
  description = "External URL for Customer service"
  type        = string
  default     = ""
}

variable "food_item_external_url" {
  description = "External URL for Food Item service"
  type        = string
  default     = ""
}

# Database variables
variable "mongodb_uri" {
  description = "MongoDB connection URI"
  type        = string
  default     = ""
  sensitive   = true
}

# Food Item PostgreSQL variables
variable "food_item_postgres_url" {
  description = "Food Item PostgreSQL connection URL"
  type        = string
  default     = ""
  sensitive   = true
}

variable "food_item_postgres_user" {
  description = "Food Item PostgreSQL username"
  type        = string
  default     = ""
  sensitive   = true
}

variable "food_item_postgres_password" {
  description = "Food Item PostgreSQL password"
  type        = string
  default     = ""
  sensitive   = true
}

# Kitchen Order PostgreSQL variables
variable "kitchen_order_postgres_url" {
  description = "Kitchen Order PostgreSQL connection URL"
  type        = string
  default     = ""
  sensitive   = true
}

variable "kitchen_order_postgres_user" {
  description = "Kitchen Order PostgreSQL username"
  type        = string
  default     = ""
  sensitive   = true
}

variable "kitchen_order_postgres_password" {
  description = "Kitchen Order PostgreSQL password"
  type        = string
  default     = ""
  sensitive   = true
}

# Notification PostgreSQL variables
variable "notification_postgres_url" {
  description = "Notification PostgreSQL connection URL"
  type        = string
  default     = ""
  sensitive   = true
}

variable "notification_postgres_user" {
  description = "Notification PostgreSQL username"
  type        = string
  default     = ""
  sensitive   = true
}

variable "notification_postgres_password" {
  description = "Notification PostgreSQL password"
  type        = string
  default     = ""
  sensitive   = true
}

# Payment PostgreSQL variables
variable "payment_postgres_url" {
  description = "Payment PostgreSQL connection URL"
  type        = string
  default     = ""
  sensitive   = true
}

variable "payment_postgres_user" {
  description = "Payment PostgreSQL username"
  type        = string
  default     = ""
  sensitive   = true
}

variable "payment_postgres_password" {
  description = "Payment PostgreSQL password"
  type        = string
  default     = ""
  sensitive   = true
}

# Customer Order PostgreSQL variables
variable "customer_order_postgres_url" {
  description = "Customer Order PostgreSQL connection URL"
  type        = string
  default     = ""
  sensitive   = true
}

variable "customer_order_postgres_user" {
  description = "Customer Order PostgreSQL username"
  type        = string
  default     = ""
  sensitive   = true
}

variable "customer_order_postgres_password" {
  description = "Customer Order PostgreSQL password"
  type        = string
  default     = ""
  sensitive   = true
}

# MercadoPago variables
variable "mercadopago_oauth_url" {
  description = "MercadoPago OAuth URL"
  type        = string
  default     = ""
}

variable "mercadopago_orders_url" {
  description = "MercadoPago Orders URL"
  type        = string
  default     = ""
}

variable "mercadopago_client_id" {
  description = "MercadoPago Client ID"
  type        = string
  default     = ""
  sensitive   = true
}

variable "mercadopago_secret_id" {
  description = "MercadoPago Secret ID"
  type        = string
  default     = ""
  sensitive   = true
}

variable "mercadopago_pos_id" {
  description = "MercadoPago POS ID"
  type        = string
  default     = ""
}

variable "mercadopago_expiration_time" {
  description = "MercadoPago Expiration Time"
  type        = string
  default     = ""
}

variable "mercadopago_webhook_secret" {
  description = "MercadoPago Webhook Secret"
  type        = string
  default     = ""
  sensitive   = true
}