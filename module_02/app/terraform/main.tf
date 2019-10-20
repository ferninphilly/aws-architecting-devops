provider "aws" {
  profile    = "tutorial"
  region     = "${var.region}"
}

resource "aws_instance" "mark" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

