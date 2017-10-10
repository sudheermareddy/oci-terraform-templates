resource "random_id" "uniqueString" {
  keepers = {
    # Generate a new id each time we create a VCN environment
    DataString = "${var.VCN-DisplayName}"
  }
  byte_length = 2
}

data  "oci_identity_availability_domains" "availdomain" {
  compartment_id = "${var.COMP-ID}"
}

data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.COMP-ID}"
    operating_system = "${var.InstanceOS}"
    operating_system_version = "${var.InstanceOSVersion}"
}
