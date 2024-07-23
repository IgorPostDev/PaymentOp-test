variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "SSH key name to access the instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
}

variable "volume_type" {
  description = "Type of the root volume (e.g., gp2, io1)"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = string
  }))
  default = []
}
