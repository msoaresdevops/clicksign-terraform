variable "aws_region" {
  type        = string
  description = "Default AWS Region"
  default     = "sa-east-1"
}

variable "instance_ami" {
  type        = string
  description = "Default AMI"
  default     = "ami-088911543b10876a4"
}

variable "instance_type" {
  type        = string
  description = "Default Instance Type"
  default     = "t2.micro"
}