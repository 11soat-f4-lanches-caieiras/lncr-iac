variable "cluster_certificate_authority_data" {
  type        = string
  description = "Base64 encoded certificate data required to communicate with the cluster."
}
variable "cluster_endpoint" {
  type        = string
  description = "Endpoint for your Kubernetes API server."
}
variable "cluster_name" {
  type        = string
  description = "Nome do cluster EKS."
}
variable "namespace" {
  description = "Namespace onde os recursos serão criados"
  type        = string
}

variable "service_account_name" {
  description = "Nome da Service Account para o CSI Driver"
  type        = string
}

variable "oidc_provider" {
  type        = string
  description = "ARN do OIDC provider para o cluster EKS."
}

variable "oidc_provider_id" {
  type        = string
  description = "ID do OIDC provider para o cluster EKS."
}
variable "region" {
  type        = string
  description = "Região do cluster EKS."
}
