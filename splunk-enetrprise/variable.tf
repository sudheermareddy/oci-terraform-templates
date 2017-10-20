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
    default = "c:/Users/sushmithan/AppData/Roaming/oci_api_keys/obmcpvt.pem"
}

variable "region" {
    type    = "string"
    default = "us-ashburn-1"
}
variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCN-DisplayName" {
  default = "splunkvcn"
}

variable "VCN-DNSLabel" {
  default = "splunkvcn"
}

variable "COMP-ID" {
  default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "SearchDomain" {
  default = "sysgain.com"
}
variable "InstanceShape" {
    default = "VM.Standard1.16"
}
variable "InstanceOS" {
    default = "Canonical Ubuntu"
}
variable "InstanceOSVersion" {
    default = "16.04"
}
variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAh84EmxAetImBHeYSVRYPQTx10vP1bQCtL3Na5Gs9RWvr5jrPjZIIYSG2io91BEpXUal4N8fZIpvVPvosHdVReox6BKTaNMUuMVsPLR3iBxypMNt+auSM/VxzVtlkYNz16ELhi+FWpFWBXrt+7f5HRrCcC180IUDykIkuOzXvljAhkgp25GyX09diNVzjl1er6CO2bj9RG/bUqFHlAuyK1OU6n/Oti+veflyFu3vra4wqfN7heWoD850ND1ychHfMwpxLfWiXTenqugyRMmZKAMnvhPqEC5eVKVr4Lqg0PbfSekm2z4LbVCZwUeSH3fON59HhwGirdHzgUcWf0QU2NQ== rsa-key-20171017"
}
variable "BootStrapFile" {
  default = "./userdata/enablepassword-user.sh"
}
variable "admin_username" {
    default = "ubuntu"

}
variable "admin_password" {
    default = "Password@1234"
}
variable "ssh_private_key" {
    default = "./userdata/splunk17.pem"
}
