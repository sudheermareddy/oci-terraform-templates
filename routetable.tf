resource "oci_core_route_table" "chefRT" {
    compartment_id = "${var.compId}"
    display_name = "${var.vcnDisplayName}-rt${random_id.unq.hex}"
    route_rules {
        cidr_block = "${var.rtCIDR}"
        network_entity_id = "${oci_core_internet_gateway.chefIG.id}"
    }
    vcn_id = "${oci_core_virtual_network.chefvcn.id}"
}
