#========================================================================================#
#                                  VPC VARIABLES                                         #
#========================================================================================#

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "number_of_azs" {
  description = "Number of Availability Zones"
  type        = number
}

variable "enable_ipv6" {
  description = "Enable IPv6 for VPC"
  type        = bool
}

variable "create_app_subnets" {
  description = "Create application subnets"
  type        = bool
}

variable "create_data_subnets" {
  description = "Create data subnets"
  type        = bool
}

variable "create_nat" {
  description = "Create NAT Gateway"
  type        = bool
}

variable "nat_gateway_high_availability" {
  description = "Enable high availability for NAT Gateway"
  type        = bool
}



variable "environment_name" {
  description = "Environment name"
  type        = string
}

variable "create_public_subnets" {
  description = "Create public subnets"
  type        = bool
}

variable "prefix_name" {
  description = "Prefix for resource names"
  type        = string
}

#========================================================================================#
#                               API GATEWAY VARIABLES                                   #
#========================================================================================#

variable "api_gateway_cors" {
  description = "CORS configuration for API Gateway"
  type = object({
    allow_credentials = optional(bool, false)
    allow_headers     = optional(list(string), ["*"])
    allow_methods     = optional(list(string), ["*"])
    allow_origins     = optional(list(string), ["*"])
    expose_headers    = optional(list(string), [])
    max_age           = optional(number, 86400)
  })
  default = {}
}

variable "api_gateway_throttle" {
  description = "Throttling settings for API Gateway"
  type = object({
    burst_limit = optional(number, 5000)
    rate_limit  = optional(number, 10000)
  })
  default = {}
}

#========================================================================================#
#                               API GATEWAY AUTHORIZATION ROUTES                        #
#========================================================================================#


variable "eks_nlb_listener_arn" {
  description = "arn of the EKS NLB listener for API Gateway integration"
  type        = string
  default     = ""
}



#========================================================================================#
#                                 OPENVPN VARIABLES                                      #
#========================================================================================#

variable "openvpn_instance_type" {
  description = "Instance type for OpenVPN"
  type        = string
}

variable "lambda_function_arn" {
  description = "Lambda function ARN for API Gateway authorizer"
  type        = string
  default     = "lncr-prd-custom-authorizer"
}

#========================================================================================#
#                                EKS VARIABLES                                           #
#========================================================================================#

variable "cluster_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
}

variable "namespaces" {
  description = "List of namespaces to create"
  type        = list(string)
}

variable "instance_type_node_eks" {
  description = "Instance type for EKS nodes"
  type        = string
}

#========================================================================================#
#                                ECR VARIABLES                                          #
#========================================================================================#

variable "ecr_repository_names" {
  description = "List of ECR repository names to create"
  type        = list(string)
  default     = ["app", "api", "worker"]
}

variable "ecr_image_tag_mutability" {
  description = "Image tag mutability setting for ECR repositories"
  type        = string
  default     = "MUTABLE"
}

variable "ecr_scan_on_push" {
  description = "Enable image scanning on push for ECR repositories"
  type        = bool
  default     = true
}

#========================================================================================#
#                               CODEBUILD VARIABLES                                     #
#========================================================================================#

variable "codebuild_projects" {
  description = "Map of CodeBuild projects with their configurations"
  type = map(object({
    codebuild_name  = string
    github_repo_url = string
  }))
}

variable "codebuild_compute_type" {
  description = "CodeBuild compute type"
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

#========================================================================================#
#                            SECRETS MANAGER VARIABLES                                 #
#========================================================================================#

variable "secrets_manager_recovery_window" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
  type        = number
  default     = 7
}

#========================================================================================#
#                               FSX OPENZFS VARIABLES                                   #
#========================================================================================#

variable "fsx_storage_capacity" {
  description = "FSx OpenZFS storage capacity in GiB"
  type        = number
  default     = 64
}

variable "fsx_throughput_capacity" {
  description = "FSx OpenZFS throughput capacity in MBps"
  type        = number
  default     = 64
}

variable "fsx_deployment_type" {
  description = "FSx OpenZFS deployment type"
  type        = string
  default     = "SINGLE_AZ_1"
}

variable "fsx_backup_retention_days" {
  description = "Number of days to retain FSx OpenZFS automatic backups"
  type        = number
  default     = 7
}

#========================================================================================#
#                                  SECRET PROVIDER VARIABLES                             #
#========================================================================================#

variable "service_account_name" {
  description = "Nome do Service Account"
  type        = string
}

variable "namespace_secrets_provider" {
  description = "Namespace do Secrets Provider"
  type        = string
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
