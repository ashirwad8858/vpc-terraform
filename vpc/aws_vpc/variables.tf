variable aws_region {
    type = string
}

variable aws_access_key {
    type = string
}

variable aws_secret_key {
    type = string
}
variable aws_vpc_cidr {
    type = string
}
variable aws_vpc_name {
    type = string
}
variable subnet_count {
  description = "The number of subnets to create"
  type        = number
  default     = 4
}