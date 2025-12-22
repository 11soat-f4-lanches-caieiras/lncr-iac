output "secret_arns" {
  description = "ARNs of the application secrets"
  value       = { for k, v in aws_secretsmanager_secret.app_secrets : k => v.arn }
}

output "secret_ids" {
  description = "IDs of the application secrets"
  value       = { for k, v in aws_secretsmanager_secret.app_secrets : k => v.id }
}

output "secret_names" {
  description = "Names of the application secrets"
  value       = { for k, v in aws_secretsmanager_secret.app_secrets : k => v.name }
}