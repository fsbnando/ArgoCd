## Neste arquivo é declarado o estado que será salvo o arquivo tfstate da estrutura.
## Por padrão o arquivo tfstate é mantido num bucket S3 chamado devtool-terraform na conta vrmanager
terraform {
  backend "s3" {
    bucket = "devtool-terraform"
    key    = "terraform-state/iac-plataforma-grafana/terraform.tfstate"
    region = "us-east-1"
  }
}