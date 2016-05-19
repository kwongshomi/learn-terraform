variable "access_key" {}
variable "secret_key" {}

variable chef_server_url {}
variable chef_validation_client_name {}
variable chef_validation_key {}
variable aws_private_key {}
variable vpc_subnet {}
variable keypair_name {}
variable availability_zone {}
variable node_name {}

variable "vpc_id" {
    default = "vpc-dccfadb9"
}

variable "vpc_security_groups" {
  default = "sg-9b9f62e0,sg-0c2a3275"
}

variable "region" {
    default = "us-east-1"
}

variable "amis" {
    default = {
      us-east-1 = "ami-6d1c2007"
      us-west-2 = "ami-ef5e24df"
    }
}

