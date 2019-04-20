output "public_ip" {
    value = "${my_deployed_server.server_name.ipv4_address}"
}

output "private_ip" {
    value = "${my_deployed_server.server_name.ipv4_address_private}"
}

output "hostname" {
    value = "${my_deployed_server.server_name.hostname}"
}