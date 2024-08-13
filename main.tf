#3.Adicione estado remoto no S3 no arquivo que chama os módulos.
terraform {
  backend "s3" {
    bucket = "terraform-state-trabalho_final"
    key    = "terraform/elb"
    region = "us-east-1"
  }
}

#2. Monte o arquivo que chama o módulo recem criado.
module "loadbalancer" {
  source = "../modules/loadbalancer"
  node_count = 3
}

