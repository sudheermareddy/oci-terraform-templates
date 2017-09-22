variable "tenancy_ocid" {
    type    = "string"
    default = "ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}

variable "user_ocid" {
    type    = "string"
    default = "ocid1.user.oc1..aaaaaaaat5pk2vhfib7bnf6n3bqsw2mjlieisfv4yfjtw5xvrkwpvvhkiloq"
}

variable "fingerprint" {
    type    = "string"
    default = "71:ea:80:93:a1:92:f8:32:85:05:66:b2:9e:fe:74:40"
}

variable "private_key_path" {
    type    = "string"
    default = "d:/baremetal/obmcpvt.pem"
}

variable "region" {
    type    = "string"
    default = "us-ashburn-1"
}

variable "compartment_ocid" {
    type    = "string"
    default = "ocid1.compartment.oc1..aaaaaaaakk5sqjfys5l2a24v5iucppxl5u56sgty6lta75hsv5ef563euhxq"
}

variable "instance_count" {
    default = "2"
}

variable "AD" {
    default = "1"
}

variable "ssh_public_key"{
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmMoOFWWd4qAKtI8SFXFM8FiqE8SRDrqSEgAPfLpq49T/lCOY2D0RvvSkTRcN2mtmxHPdBllr97sql1OzQnWY2cVuQzs0G4vZMWCN8QFx5UQgavUcSJRuICfWvHQOy14CwYDaU+upTXPIlSX3V/lF5aBHHTGJ/lU2HudwJT44j1TZ9wYtj9+pvoEXbaQopAipt9ZuQOmzEOfmSYkg4B6WWqw3vcJQtMFvcnEtmle96pb6wlCYcmHuLJmPh7Me6E3+wLPika6L48YJ3gKN4lIDoW9SADjODH8mzbdOomW1dORLJPjG4esyO3SAsNvK33DdcgoQ7XIF7blzlG5n2m8wqw== rsa-key-20170921"
}

variable "InstanceShape" {
    default = "VM.Standard1.8"
}

variable "InstanceOS" {
    default = "Canonical Ubuntu"
}

variable "InstanceOSVersion" {
    default = "16.04"
}

variable "2TB" {
    default = "2097152"
}

variable "256GB" {
    default = "262144"
}

variable "BootStrapFile" {
    default = "./userdata/bootstrap"
}

