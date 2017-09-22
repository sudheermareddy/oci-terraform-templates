resource "oci_core_route_table" "rt" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_virtual_network.vcn1.id}"
    display_name = "routetable1"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${oci_core_internet_gateway.igw.id}"
    }
}