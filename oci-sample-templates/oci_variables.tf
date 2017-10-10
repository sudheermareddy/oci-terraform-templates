variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCN-DisplayName" {
  default = "vivekvcn25"
}

variable "VCN-DNSLabel" {
  default = "vcn-sys"
}

variable "COMP-ID" {
  default = "ocid1.compartment.oc1..aaaaaaaakk5sqjfys5l2a24v5iucppxl5u56sgty6lta75hsv5ef563euhxq"
}

variable "SearchDomain" {
  default = "sysgainoci.com"
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
variable "InstancePublicKey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrfN/AtYswqoXMB/c1WNBTzwuTketORex7gpAUcrtbsHUI5azpzz5lQHdW4egwOM9k96oQzBMiwpOxGME40iMqh3DYo5eOI44YgxxVQQH/nL13RMiFwq+HORGVwpQGXsV/NmDpC+8dv5BJnhj3rfXQ/zvWa3+vtpkD+HpEpM+1wjSV+6Xg84YW60ptIrFk6pr+YTZDGxq4Uo4KJ3PvcVWhtoG0CLDANHn666kdenyCvHOSfIlwMNf4F2Cq8VM8L52tVe6oTb5n01H5WRKHjv7UyVvDC02N0OttAr0vdLQLhwA4wsRCQu/AkzXp7F7VklIqj8giEYV40GF40J00gvSR root@Terraform"
}
variable "PublicIPAllocationMethod" {
    default = "true"
}
variable "BootStrapFile" {
default = "./userdata/bootstrap.tf"
}
