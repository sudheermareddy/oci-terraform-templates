// creating route table
resource "oci_core_route_table" "ELkRoutetable" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-rt${random_id.uniqueString.hex}"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${oci_core_internet_gateway.ELKinternetgateway.id}"
    }
    vcn_id = "${oci_core_virtual_network.ElkVcn.id}"
}

