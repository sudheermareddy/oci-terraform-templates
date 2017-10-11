variable "tenancy_ocid" {
    default ="ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}
variable "user_ocid" {
    default = "ocid1.user.oc1..aaaaaaaat5pk2vhfib7bnf6n3bqsw2mjlieisfv4yfjtw5xvrkwpvvhkiloq"
}
variable "fingerprint" {
    default = "17:a3:de:96:8b:f6:b4:d5:69:29:77:cb:b9:cb:42:a4"
}
variable "private_key_path" {
    default = "c:/Users/ynaik/AppData/Roaming/oci/pvt.pem"
}
variable "region" {
    default = "us-ashburn-1"
}
variable "compartment_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "InstanceShape" {
    default = "VM.Standard1.8"
}
variable "ssh_public_key"  {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA7WTdp3TMn3HMW1xFEKU56gGeoXrdcn7MjPeh0QrzTzBzKBXzgIZr7FjeaZewSpBRRgy4iFmnM5U/XGJR2ztf2BavPFY10mQTf94yWoYVQY2p5jWrtIpYeRGSfy1KkfZL99WKhrW3ZWeISs7T+4e+f7zWwCv094q9LYfmGScDvMF7HJMZYEvPaDEmXvPu7pf499C90OBD//XiREVVHZHjNpbSyD33KA660r4lScoNBYY4jJWAHtTJePyLr3+ainOAVkz4J4zWeo+hfiurRdxaFf9NBo1Q7VRRS0hOyG9MPzlIYQUfZi6/yeS0yIfoLZjA5OBXgvrJ3h2E94019V8mDw== rsa-key-20171009"
}
variable "BootStrapFile" {
    default ="./userdata/jenkin-installscript.sh"
}



variable "InstanceOS" {
    default = "Canonical Ubuntu"
}

variable "InstanceOSVersion" {
    default = "16.04"
}