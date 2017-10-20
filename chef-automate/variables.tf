variable "vcnCidr" {
  default = "10.0.0.0/16"
}
variable "DnsLabel" {
  default = "chefautomate"
}
variable "compId" {
  default = "ocid1.compartment.oc1..aaaaaaaakk5sqjfys5l2a24v5iucppxl5u56sgty6lta75hsv5ef563euhxq"
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
variable "InstanceOS" {
  default = "Canonical Ubuntu"
}
variable "InstanceOSVersion" {
  default = "16.04"
}
variable "InstanceShape" {
    default = "VM.Standard1.2"
}
variable "nicName" {
    default = "chefNIC"
}
variable "wInstanceOS" {
  default = "Windows"
}
variable "wInstanceOSVersion" {
  default = "Server 2012 R2 Standard"
}
variable "sshKey" {
default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAm2G0ViZ6wlreVdfTkepqxnr0VIwon8WNIjhAiSnO3aMlU6WnozOGAF1qVzk5I4ugGpcXMmGvIbY5TOB4jH4dDF3AZljELsku6mOc7HtEL5wxM1ARq8PwrBuW6RfdzwRVgEYGqp25gwoY+nrPPwmceNF7mH3EBzqxFbtMOKsMfXeOzbUvH+fEYvZLUhsx7OJzd5HNWgnng9YvLOv54dopPJXhoiWd5ato4gppRgBC05bmTAdPOewx3WrrJxm0jl08gOAlhOQjv0EOJwaUMEFrMd8iW2LHSv2g97pQ69nu6j/XksB6YIUvUS22qUFP/oD47EUm2U2oA/5cFz+XwRqjzw== rsa-key-20171016"
}
variable "BootStrapFile" {
    default = "./scripts/ssh_private_key.pem"
}
variable "BootStrapFile1" {
    default = "./scripts/google.tf"
}




