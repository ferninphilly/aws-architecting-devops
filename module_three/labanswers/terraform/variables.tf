variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-40d28157"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/fernandopombeiro/.ssh/id_rsa.pub"
}

variable "script_source" {
    description = "The source of our initialization script for our ec2 instances"
    default = "/Users/fernandopombeiro/github_projects/aws-architecting-devops/app/terraform/install.sh"
}

variable "private_key" {
    description = "SSH Private Key Path"
    default = "/Users/fernandopombeiro/.ssh/id_rsa"
}

variable "dbtype" {
    description = "This is the database type and size"
    default = "db.t2.micro"
}

variable "dbversion" {
    description = "This is the version that we are deploying. Default is mysql 5.7"
    default = "5.7"
}

variable "username" {
    description = "The username to access the mysql cluster"
    default = "vorhees"
}

variable "password" {
    description = "The default user password to access the mysql cluster"
    default = "campcrystallake"
}

variable "db" {
    description = "This will be the default db created with the rds instance"
    default = "mydb"
}

variable "dbengine" {
    description = "What kind of RDS instance to deploy" 
    default = "mysql"
}