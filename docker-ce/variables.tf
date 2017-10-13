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
    default = ""
}

variable "compartment_ocid" {
    default = ""
}

variable "prefix" {
    default = "dce"
}

variable "sshPublicKey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA3MLOkhGaNkLl1gLuExEIoyP6u/1DjbCxGzhLIccEl4UajiNE9yx8ae47+DSKpl9zi6eeI2zyn88VzJ5twkl2hQrTi5T4E36ujS4QbtmCWj1a1hj2dub7STZBkmsYmh5QUz7Nw8wbvkaJy7wrnXJ2bGRGXomyNlpOxMdlFvjeW5mFFQmwyCDpBiqkOi72NpMRfcPF/R1H0uodeqXZf+Xrvw86mz2OtnzXR8sX2r1DXFobm8NycZbhL8HszWadDi7TO9rQvUoRPkc+Q8CgCXi557cVXUbTpdCC/eJviKlKlpgZYem5Uq4wi29Qijm0Ev2EEfMahMgqNQhGagcLRWapZQ== rsa-key-20170306"
}

variable "ssh_private_key" {
    default = "./userdata/docker-td-pvt-key.pem"
}

variable "admin_username" {
    default = "docker"
}

variable "admin_password" {
    default = "Docker2017"
}

variable "instance_count" {
    default = "1"
}

variable "instanceShape" {
    default = "VM.Standard1.2"
}

variable "instanceLinOS" {
    default = "Canonical Ubuntu"
}

variable "instanceLinOSVersion" {
    default = "16.04"
}

variable "BootStrapFileDir" {
    default = "./userdata/enable-password-auth-user.sh"
}



