resource "oci_core_internet_gateway" "igw" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "IGW1"
    vcn_id = "${oci_core_virtual_network.vcn1.id}"
}