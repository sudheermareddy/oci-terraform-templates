data  "oci_identity_availability_domains" "availdomain" {
  compartment_id = "${var.compartment_id}"
}

data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.compartment_id}"
    operating_system = "${var.InstanceOS}"
    operating_system_version = "${var.InstanceOSVersion}"
}
