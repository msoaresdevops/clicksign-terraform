# clicksign-terraform

## Instância EC2 e Web Server Nginx com Terraform.

Módulo Terraform para provisionamento de infraestrutura na AWS conforme diagrama.

<div align="center">
<img src="https://user-images.githubusercontent.com/86880696/156343047-396dcd88-aea0-4815-8bb2-485b574d87df.png"/>
</div>

## Deploy da Aplicação

Para criar um novo recurso usando o EC2 Module, basta criar um arquivo main.tf conforme exemplo e abrir uma pull request.

~~~
terraform {
  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
  }
}

provider "aws" {
  region = "sa-east-1"
}

module "webserver-ec2" {
  source        = "./ec2-module"
  name          = "web1"
  ami           = "ami-088911543b10876a4"
  instance_type = "t2.micro"
  tags = {
    Owner     = "Marcos Soares"
    Project   = "Clicksign"
    ManagedBy = "Terraform"
  }
}

~~~ 

>Para armazenamento do arquivo de estado do terraform (tfstate) de forma segura, é necessário inserir as informações do bucket onde o arquivo será salvo.

## Fluxo de Deploy da Aplicação.
<div align="center">
<img src="https://user-images.githubusercontent.com/86880696/156347380-33ad45a5-e966-4014-8543-3e435103cd76.png"/>
</div>

## Quais os recursos que são criados com esse Código? 
Como resultado, teremos os seguintes recursos criados na AWS.
* Instância EC2
* 1 VPC
* 2 Subnets Publicas
* 2 Subnets Privadas
* 1 Security Group
* 1 Web Site Estático conforme imagem.
<div align="center">
<img src="https://user-images.githubusercontent.com/86880696/156349308-ea112e9c-dfe9-4fee-a650-68796a8fd918.png"/>
</div>
