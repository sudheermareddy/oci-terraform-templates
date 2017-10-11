data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_core_images" "LinImageOCID" {
    compartment_id = "${var.compartment_ocid}"
    operating_system = "${var.instanceLinOS}"
    operating_system_version = "${var.instanceLinOSVersion}"
}

