resource "upcloud_server" "server1" {
    # System hostname
    hostname = "terraform.example.com"

    # Availability zone
    zone = "${var.zones["amsterdam"]}"
    
    # Number of CPUs and memory in GB
    plan = "${var.plans["5USD"]}"
    
    storage_devices = [
        {
            # OS root disk size
            size = "${lookup(var.storage_sizes, var.plans["5USD"])}"
            action = "clone"

            # Template UUID for Ubuntu 18.04
            storage = "${var.templates["ubuntu18"]}"
            tier = "maxiops"
        }
    ]

    # Include at least one public SSH key
    login {
        user = "${var.users[0]}"
        create_password = "${var.set_password}"
        keys = [
            "${var.public_key}"
        ]
    }

    connection {
        host = "${self.ipv4_address}"
        type = "ssh"
        user = "${var.users[0]}"
        private_key = "${file(var.private_key_path)}"
    }
}