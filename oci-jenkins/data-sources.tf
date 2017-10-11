data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_core_images" "OLImageOCID" {
  compartment_id = "${var.compartment_ocid}"
  operating_system = "${var.InstanceOS}"
  operating_system_version = "${var.InstanceOSVersion}"
}