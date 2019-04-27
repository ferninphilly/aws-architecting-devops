provider "aws" {
  region = "${var.aws_region}"
  profile = "codices"
}

# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "vpctestkeypair"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.zuuuul.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"

  tags {
    Name = "webserver"
  }
}

# Define SSH key pair for our instances
resource "aws_key_pair" "zuuuul" {
  key_name = "iamthekeymaster"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_db_instance" "madmax" {
  allocated_storage         = 20
  storage_type              = "gp2"
  engine                    = "${var.dbengine}"
  engine_version            = "${var.dbversion}"
  instance_class            = "${var.dbtype}"
  name                      = "${var.db}"
  username                  = "${var.username}"
  password                  = "${var.password}"
  parameter_group_name      = "default.mysql5.7"
  port                      = 3306
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
  db_subnet_group_name      = "${aws_db_subnet_group.beastmastersubgroup.id}"
  vpc_security_group_ids    = ["${aws_security_group.sgdb.id}"]
}
