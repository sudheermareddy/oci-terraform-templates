resource "oci_core_subnet" "subnet" {
compartment_id = "${var.compartment_ocid}"
availability_domain = "${data.oci_identity_availability_domains.ADs.availability_domains.0.name}"
route_table_id = "${oci_core_route_table.routetable.id}"
vcn_id = "${oci_core_virtual_network.vcn.id}"
security_list_ids = ["${oci_core_security_list.nsg.id}"]
dhcp_options_id = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
dns_label = "jenkinssubnet"
cidr_block = "10.0.0.0/24"
}