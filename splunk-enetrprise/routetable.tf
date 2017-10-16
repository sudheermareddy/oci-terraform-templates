
resource "oci_core_route_table" "routetable" {
    compartment_id = "${var.COMP-ID}"
    display_name = "${var.VCN-DisplayName}-rt${random_id.uniqueString.hex}"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${oci_core_internet_gateway.internetgateway.id}"
    }
    vcn_id = "${oci_core_virtual_network.VCN.id}"
}
