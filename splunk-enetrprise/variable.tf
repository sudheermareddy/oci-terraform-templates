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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAnHCRoCxwg5G3D3S8ZITGcG1t1KNcMWektPN/orKdjGxYYWGLY6Z1XM6h89t/qVuoMIJWhhpSXOZ8EE5VauljeCBIUGacSauy72fChGbsHqwHuWpxxA6q2xGrYc0e1xDc9auIKO6F1XXz8U+O/ColBbdjhRmsGI9t5/GGJJhh8zeGzy2QDl0BEeayGCwMjMBM4fzSfpag2e/mgL+o9hst3CoamZCeaGPagOY/4iGZFeIYJ4Fkfmamm57Bw5ACvGKEaPfM1QoEaduox1eYv+rAzf5g+dnZiq/sA1piup+/kg9aiRaBzu5uBpt52X+o1ISzHleMUdyHT5Mx57HMyVSkMQ== rsa-key-20171016"
}
variable "BootStrapFile" {
  default = "./userdata/splunk-install.sh"
}
variable "admin_username" {
    default = "splunk"
}
variable "ssh_private_key" {
    default = "./userdata/splunk17.pem"
}
