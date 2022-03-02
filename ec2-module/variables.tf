variable "name" {
  description = "Nome que será atribuída a Instância EC2"
  type        = string
  default     = ""
}

variable "ami" {
  type        = string
  description = "AMI da Instância EC2"
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "Tipo de Instância EC2"
  default     = ""
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}




