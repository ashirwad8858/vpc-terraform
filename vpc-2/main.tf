# main.tf

# Configure the AWS provider
provider "aws" {
  region = "us-east-1" # Change this to your desired region
  access_key = ""
  secret_key = ""
  
}

# Call the VPC module
module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.10.0.0/16"
  subnet_count = 2
}

# Call the EC2 module
module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0a0e5d9c7acc336f1" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_ids[0] # Use the first subnet ID from the VPC module
}

# Output the instance ID
output "instance_id" {
  value = module.ec2.instance_id
}
