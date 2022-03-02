output "public_ip" {
  value = aws_instance.web-server.public_ip
}

output "public_dns" {
  value = aws_instance.web-server.public_dns
}

output "vpc_id" {
  value = aws_vpc.web-server.id
}

output "igw_id" {
  value = aws_internet_gateway.web-server.id
}

output "subnet_ids" {
  value = { for k, v in aws_subnet.web-server : v.tags.Name => v.id }
}