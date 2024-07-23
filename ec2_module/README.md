# EC2 Module

## Variables

- `region` (string): AWS region. Default: `us-east-1`
- `instance_type` (string): Type of EC2 instance.
- `ami` (string): AMI ID for the instance. If not provided, the latest Ubuntu AMI will be used.
- `key_name` (string): SSH key name to access the instance.
- `volume_size` (number): Size of the root volume in GB.
- `volume_type` (string): Type of the root volume (e.g., gp2, io1).
- `instance_name` (string): Name of the instance.
- `security_group_name` (string): Name of the security group.
- `ingress_rules` (list of objects):
  - `from_port` (number): Starting port for the rule.
  - `to_port` (number): Ending port for the rule.
  - `protocol` (string): Protocol for the rule (e.g., tcp, udp).
  - `description` (string): Description of the rule.
  - `cidr_blocks` (string): CIDR block for the rule.

## Example Usage

```hcl
module "ec2_instance" {
  source = "./ec2_module"

  region              = "us-east-1"
  instance_type       = "t2.micro"
  key_name            = "my-key"
  volume_size         = 20
  volume_type         = "gp2"
  instance_name       = "my-instance"
  security_group_name = "my-security-group"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH from 0.0.0.0/0"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

## Backend Configuration Example (S3)

terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket"
    key            = "path/to/my/key"
    region         = "us-east-1"
    dynamodb_table = "my-lock-table"
  }
}


#### Приклад використання

```hcl
module "ec2_instance" {
  source = "./ec2_module"

  region              = "us-east-1"
  instance_type       = "t2.micro"
  key_name            = "my-key"
  volume_size         = 20
  volume_type         = "gp2"
  instance_name       = "my-instance"
  security_group_name = "my-security-group"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH from 0.0.0.0/0"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket"
    key            = "path/to/my/key"
    region         = "us-east-1"
    dynamodb_table = "my-lock-table"
  }
}
