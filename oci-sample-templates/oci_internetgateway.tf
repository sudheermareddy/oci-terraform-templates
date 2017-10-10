resource "oci_core_internet_gateway" "internetgateway" {
    compartment_id = "${var.COMP-ID}"
    display_name = "${var.VCN-DisplayName}-igw${random_id.uniqueString.hex}"
    vcn_id = "${oci_core_virtual_network.vcn1.id}"
}
