data  "oci_identity_availability_domains" "availdomain" {
  compartment_id = "${var.COMP-ID}"
}

data "oci_core_images" "ImageOCID" {
    compartment_id = "${var.COMP-ID}"
    operating_system ="${var.InstanceOS}"
    operating_system_version =  "${var.InstanceOSVersion}"
}