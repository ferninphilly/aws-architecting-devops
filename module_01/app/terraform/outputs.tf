output "rds_endpoint" {
  description = "This is the endpoint for the rds mysql instance we created"
  value = "${aws_db_instance.madmax.endpoint}"
}

output "webserver_endpoint" {
    description = "This is the dns endpoint for the webserver that we created."
    value="${aws_instance.wb.public_dns}"
}

output "webserver_ip" {
    description = "This is the IP address of our webserver IP instance"
    value="${aws_instance.wb.public_ip}"
}