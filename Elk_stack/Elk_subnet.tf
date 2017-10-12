  // create subnet
  resource "oci_core_subnet" "Elksubnet1" {
  compartment_id = "${var.compartment_id}"

  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  route_table_id      = "${oci_core_route_table.ELkRoutetable.id}"
  vcn_id              = "${oci_core_virtual_network.ElkVcn.id}"
  security_list_ids   = ["${oci_core_security_list.ElksecurityRules.id}"]
  dhcp_options_id     = "${oci_core_dhcp_options.ELkdhcp-options.id}"
  dns_label           = "elk${random_id.uniqueString.hex}"
  display_name        = "${var.VCN-DisplayName}-publicsubnet${random_id.uniqueString.hex}"
  cidr_block          = "10.0.0.0/24"
}
