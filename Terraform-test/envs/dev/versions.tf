terraform {
  required_providers {
    aws = {
      version = ">= 3.0"
      source  = "hashicorp/aws"
    }
    # keypairの作成に利用。
    tls = {
      version = ">=3.1.0"
      source  = "hashicorp/tls"
    }
  }
  required_version = ">= 1.1.5"
}

provider "aws" {
  region = "ap-northeast-1"

  # 全リソースにEnvtypeタグを付与。 
  default_tags {
    tags = {
      EnvType = "dev"
    }
  }
}
