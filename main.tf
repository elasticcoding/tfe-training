#
# DO NOT DELETE THESE LINES UNTIL INSTRUCTED TO!
#
# Your AMI ID is:
#
#     ami-09943f9da1f1b7899
#
# Your subnet ID is:
#
#     subnet-05e9f01e53c9a38dd
#
# Your VPC security group ID is:
#
#     sg-0cf3d1190f348f5e5
#
# Your Identity is:
#
#     terraform-nyl-buffalo
#

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-1"
}

module "keypair" {
  source = "../key-pair"

}

module "server" {
  depends_on = [module.keypair]
  source = "../server"
  servers = var.servers
  identity = var.identity
  key     = module.keypair.keypair
  
}

output "public_ip" {
  value = module.server.public_ip
}

output "public_dns" {
  value = module.server.public_dns
}

output "ami-id" {
  value = data.aws_ami.ubuntu_16_04.image_id
}