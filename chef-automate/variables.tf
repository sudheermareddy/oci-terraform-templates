variable "vcnCidr" {
  default = "10.0.0.0/16"
}
variable "DnsLabel" {
  default = "chefautomate"
}
variable "compId" {
  default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "vcnDisplayName" {
  default = "chef"
}
variable "rtCIDR" {
  default = "0.0.0.0/0"
}
variable "subnet1" {
  default = "10.0.0.0/24"
}
variable "LinuxInstanceOS" {
  default = "Canonical Ubuntu"
}
variable "LinuxInstanceOSVersion" {
  default = "16.04"
}

variable "InstanceShape" {
    default = "VM.Standard1.2"
}
variable "nicName" {
    default = "chefNIC"
}
variable "sshKey" {
default="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgjlDRLYd04RyvpSosOwsv3eGKuRQ9qTYcVnX8HOAggoxL0pNzvSPL3D8esqedIQlkkwYezFqpdCU/U0lIpEYuA6vuWcDPY5t+Z+uo+TOctDJDJHmXEvv98ezgXB18LPYgSGQH+grGlLYwZUk+kNqgy5lDZkjcLLLldRdrekcxudVCt8bOzcozOi7bGVQ77dNC5TBcf2RLmDPV+fJENZnt/q3wmomoPiQ4D4pW+ep7U1xiUF6yL23Gfcig0g9N9wOroEDMVZIyLFxL15gNqw3Du8x36yDOV+A/2NNW0/3jc+C/2YHcHt39c+ME0YvtC3GpZTHhO8ZoSd4oyCJPqAiYw== rsa-key-20171012"
}
variable "chef-server" {
  default ="./user-data/chefserver.sh"
}

variable "chef-automate" {
  default ="./user-data/chefautomate.sh"
}

variable "ssh_private_key" {
  default ="./user-data/ssh_private_key.pem"
}
variable "chef-windowsvm" {
  default ="./user-data/ws1.ps1"
}
variable "BootStrapFile1" {
  default ="./user-data/enablepassword.sh"
}
variable "WindowsInstanceOS" {
  default = "Windows"
}
variable "WindowsInstanceOSVersion" {
  default = "Server 2012 R2 Standard"
}
variable "WindowsInstanceOSVersion" {
  default = "Server 2012 R2 Standard"
}



