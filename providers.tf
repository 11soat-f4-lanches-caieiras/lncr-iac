terraform {
  backend "s3" {
    bucket = "lncr-soat-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.17.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "= 1.19.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.37.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

provider "kubectl" {
  host                   = module.clouddog-eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.clouddog-eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.clouddog-eks.cluster_name
    ]
  }
}
provider "helm" {
  kubernetes {
    host                   = module.clouddog-eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.clouddog-eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        module.clouddog-eks.cluster_name,
        "--region",
        local.region
      ]
    }
  }
}

provider "kubernetes" {
  host                   = module.clouddog-eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.clouddog-eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.clouddog-eks.cluster_name,
      "--region",
      local.region
    ]
  }
}