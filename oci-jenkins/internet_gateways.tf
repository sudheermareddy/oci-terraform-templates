resource "oci_core_internet_gateway" "internetgateway" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "jenkinsgateway"
    vcn_id = "${oci_core_virtual_network.vcn.id}"
}