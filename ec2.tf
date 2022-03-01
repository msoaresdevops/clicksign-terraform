resource "aws_instance" "web-server" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = "efraimben"
  user_data              = file("script.sh")
  tags                   = local.common_tags
  vpc_security_group_ids = [aws_security_group.docker.id, aws_security_group.ssh.id, aws_security_group.https.id]
}