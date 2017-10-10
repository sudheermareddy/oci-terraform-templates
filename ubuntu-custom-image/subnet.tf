resource "oci_core_subnet" "sub" {
  count = "${var.instance_count}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  cidr_block = "10.1.${count.index}.0/24"
  display_name = "subnet${count.index}"
  dns_label = "subnet${count.index}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  route_table_id = "${oci_core_route_table.rt.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
  security_list_ids = ["${oci_core_security_list.nsl1.id}"]

}

