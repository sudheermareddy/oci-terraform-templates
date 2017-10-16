resource "random_id" "unq" {
  byte_length = 2
}

data "oci_identity_availability_domains" "chefAD" {
  compartment_id = "${var.compId}"
}

data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.compId}"
    operating_system = "${var.InstanceOS}"
    operating_system_version="${var.InstanceOSVersion}"
    }
data "oci_core_images" "wImageOCID" {
  compartment_id = "${var.compId}"
  operating_system = "${var.wInstanceOS}"
  operating_system_version = "${var.wInstanceOSVersion}"
}
