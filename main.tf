terraform {
  backend "s3" {
    bucket = "tfstate-action-1020246789"
    key    = "foo/terraform.tfstate"
    region = "sa-east-1"
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
    Owner       = "Marcos Soares"
    Environment = "Prod"    
  }
}

output "public_ip" {
  value = module.webserver-ec2.public_ip
}

output "public_dns" {
  value = module.webserver-ec2.public_dns
}

output "vpc_id" {
  value = module.webserver-ec2.vpc_id
}

output "igw_id" {
  value = module.webserver-ec2.igw_id
}

output "subnet_ids" {
  value = module.webserver-ec2.subnet_ids
}

