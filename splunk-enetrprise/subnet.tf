
resource "oci_core_subnet" "subnet1" {
  compartment_id = "${var.COMP-ID}"

  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  route_table_id      = "${oci_core_route_table.routetable.id}"
  vcn_id              = "${oci_core_virtual_network.VCN.id}"
  security_list_ids   = ["${oci_core_security_list.securitylist.id}"]
  dhcp_options_id     = "${oci_core_dhcp_options.dhcp-options.id}"
  dns_label           = "${var.VCN-DisplayName}${random_id.uniqueString.hex}"
  display_name        = "${var.VCN-DisplayName}-sub${random_id.uniqueString.hex}"
  cidr_block          = "10.0.0.0/24"
}
