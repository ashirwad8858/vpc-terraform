# modules/ec2/variables.tf

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}
