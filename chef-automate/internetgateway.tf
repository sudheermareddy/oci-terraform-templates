resource "oci_core_internet_gateway" "chefIG" {
    compartment_id = "${var.compId}"
    display_name = "${var.vcnDisplayName}-igw${random_id.unq.hex}"
    vcn_id = "${oci_core_virtual_network.chefvcn.id}"
}
