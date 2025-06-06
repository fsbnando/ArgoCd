## Esta sessão define o profile da conta vrmanager, e utiliza switchrole para a conta AWS definida pelo
## workspace utilizado (VRPRD) no arquivo variables.tf.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }
}

## Configura a acessibilidade do terraform a conta AWS via switch-role
## PS: Necessario ter configurado as variaveis e o workspace para funcionar.
provider "aws" {
  region = var.workspace_iam_region[terraform.workspace]

  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
}
