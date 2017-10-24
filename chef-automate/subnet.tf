resource "oci_core_subnet" "chefsubnet1" {
  compartment_id = "${var.compId}"

  availability_domain = "${data.oci_identity_availability_domains.chefAD.availability_domains.0.name}"
  route_table_id      = "${oci_core_route_table.chefRT.id}"
  vcn_id              = "${oci_core_virtual_network.chefvcn.id}"
  security_list_ids   = ["${oci_core_security_list.chefsecurity.id}"]
  dhcp_options_id     = "${oci_core_dhcp_options.chefdhcp.id}"
  dns_label = "chefautomate"
  display_name               = "${var.vcnDisplayName}-subnet1${random_id.unq.hex}"
  cidr_block                 = "${var.subnet1}"
}
