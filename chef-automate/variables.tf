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
    default = "VM.Standard1.8"
}
variable "nicName" {
    default = "chefNIC"
}
variable "sshKey"{
default="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxo2e9w3zPlXp7UwDDEWMmnqKnIQfErxfry88QSnFGZ3gkMxpi/gWrLVBh5U1Wo+9JsvpkUF9hZtGSgAa8ArGWzTUITqhE+ZwVkIFkBfR+5kSGWFsFm/dvth8AhDElfMJA082ZcuhaeffdVMrN6hm4EkFIntVBeRWt49DwMY/ohliJIAcUAtLy/0Vb9Ok3H6ceCH8IK5vFA2iKJzfWa2m1w9KDmTNRjsqsqMCvGtwGw/qn/EAN6iyexLXQp7ONh9I9rsATgOb5RI4Nid0URCVSneVKnmzOSWQYvydG+JWRqumBUzy0CfG8MFSVJyyEg6E/78Ac8gG1YhvOLwe23VWfw== rsa-key-20171009"
}