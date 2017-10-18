resource "oci_core_subnet" "sub1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block = "10.2.1.0/24"
  display_name = "${var.prefix}-subnet1"
  dns_label = "${var.prefix}${random_id.unq.hex}subnet1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  route_table_id = "${oci_core_route_table.rt.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
  security_list_ids = ["${oci_core_security_list.nsl1.id}"]
}

resource "oci_core_subnet" "sub2" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  cidr_block = "10.2.2.0/24"
  display_name = "${var.prefix}-subnet2"
  dns_label = "${var.prefix}${random_id.unq.hex}subnet2"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  route_table_id = "${oci_core_route_table.rt.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
  security_list_ids = ["${oci_core_security_list.nsl1.id}"]
}
