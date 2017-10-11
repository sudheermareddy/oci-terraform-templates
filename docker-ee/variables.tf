variable "tenancy_ocid" {
    default = ""
}

variable "user_ocid" {
    default = ""
}

variable "fingerprint" {
    default = ""
}

variable "private_key_path" {
    default = ""
}

variable "region" {
    default = "us-ashburn-1"
}

variable "prefix" {
    
}

variable "compartment_ocid" {
    default = ""
}

variable "sshPublicKey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAtybP5Ud490SHPp/JORglAwD682F6t+0ry4Kn2lakGXt7dnepdjlj4FtO4YMd9HBl8WJ5fz4xL1NjUBt/9qpIGnPBLLByU0T7jeh5R6NblcrEYDOgX0eh4mCZxs1f5ldOXuLWUuExsSv3XewarBtWkZqnatS1XIj7flJa6Vv+OkMiFprAt7bw9p4aKH4X/zlv9gf6+Xw38DyPIMN73/pCA9OBkp1Mwzk64u5NpwzivW8FD2KFvuzTtj+YPPstZFEA1XKT25xWK5E5rl3LeZ7gAhowaXQ9ajLNkQF9BFONsyNzdFd+qn0elG5ORDH24yqYlpxmR8uEi+YrRAgqLWF+0w== rsa-key-20170925"
}

variable "ssh_private_key" {
    default = "./userdata/instance_pvt_key.pem"
}

variable "admin_username" {
    default = "docker"
}

variable "admin_password" {
    default = "Docker2017"
}

variable "AD" {
    default = "1"
}

variable "instance_count" {
    default = "1"
}

variable "instanceShape" {
    default = "VM.Standard1.8"
}

variable "instanceLinOS" {
    default = "Canonical Ubuntu"
}

variable "instanceLinOSVersion" {
    default = "16.04"
}

variable "instanceWinOS" {
    default = "Windows"
}

variable "instanceWinOSVersion" {
    default = "Server 2012 R2 Standard"
}

variable "BootStrapFileDir" {
    default = "./userdata/docker-install-user.sh"
}

variable "docker_ee_url" {
    default = "https://storebits.docker.com/ee/m/sub-0e563857-debd-4f5c-bd36-139b5e7d65a6/ubuntu/gpg"
}

