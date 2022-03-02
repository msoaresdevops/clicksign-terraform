resource "aws_instance" "web-server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = file("ec2-module/script.sh")
  tags                   = var.tags
  vpc_security_group_ids = [aws_security_group.container-docker.id, aws_security_group.https.id]
}

resource "aws_vpc" "web-server" {
  cidr_block = "192.168.0.0/16"

}

resource "aws_internet_gateway" "web-server" {
  vpc_id = aws_vpc.web-server.id
}

resource "aws_subnet" "web-server" {
  for_each = {
    "pub_a" : ["192.168.1.0/24", "sa-east-1a", "Public A"]
    "pub_b" : ["192.168.2.0/24", "sa-east-1b", "Public B"]
    "pvt_a" : ["192.168.3.0/24", "sa-east-1a", "Private A"]
    "pvt_b" : ["192.168.4.0/24", "sa-east-1b", "Private B"]
  }

  vpc_id            = aws_vpc.web-server.id
  cidr_block        = each.value[0]
  availability_zone = each.value[1]

  tags = merge(var.tags, { Name = each.value[2] })

}

resource "aws_security_group" "container-docker" {
  name        = "Web"
  description = "Permitir trafego Publico de Entrada na Porta 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "https" {
  name        = "https"
  description = "Permitir trafego de Saida para a internet"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}







