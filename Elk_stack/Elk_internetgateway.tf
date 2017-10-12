// creating internetgatewaqy

resource "oci_core_internet_gateway" "ELKinternetgateway" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-igw${random_id.uniqueString.hex}"
    vcn_id = "${oci_core_virtual_network.ElkVcn.id}"
}
