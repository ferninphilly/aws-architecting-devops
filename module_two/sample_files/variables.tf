
variable "private_key_path" {
    type = "string"
    default = "/home/user/.ssh/terraform_rsa"
}

variable "public_key" {
    type = "string"
    default = "ssh-rsa terraform_public_key"
}

variable "zones" {
    type = "map"
    default = {
        "amsterdam" = "nl-ams1"
        "london"    = "uk-lon1"
        "frankfurt" = "de-fra1"
        "helsinki1" = "fi-hel1"
        "helsinki2" = "fi-hel2"
        "chicago"   = "us-chi1"
        "sanjose"   = "us-sjo1"
        "singapore" = "sg-sin1"
    }
}

variable "plans" {
    type = "map"
    default = {
        "5USD"   = "1xCPU-1GB"
        "10uSD"  = "1xCPU-2GB"
        "20USD"  = "2xCPU-4GB"
    }
}

variable "storage_sizes" {
    type = "map"
    default = {
        "1xCPU-1GB"  = "25"
        "1xCPU-2GB"  = "50"
        "2xCPU-4GB"  = "80"
    }
}
variable "templates" {
    type = "map"
    default = {
        "ubuntu18" = "01000000-0000-4000-8000-000030080200"
        "centos7"  = "01000000-0000-4000-8000-000050010300"
        "debian9"  = "01000000-0000-4000-8000-000020040100"
    }
}

variable "set_password" {
    type = "boolean"
    default = false
}

variable "users" {
    type = "list"
    default = ["root", "user1", "user2"] 
}