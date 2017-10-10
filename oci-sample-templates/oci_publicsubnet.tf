resource "oci_core_subnet" "subnet1" {
  compartment_id = "${var.COMP-ID}"

  availability_domain = "${data.oci_identity_availability_domains.availdomain.availability_domains.0.name}"
  route_table_id      = "${oci_core_route_table.routetable.id}"
  vcn_id              = "${oci_core_virtual_network.vcn1.id}"
  security_list_ids   = ["${oci_core_security_list.publicsgl.id}"]
  dhcp_options_id     = "${oci_core_dhcp_options.dhcp-options1.id}"
  dns_label           = "ps1${random_id.uniqueString.hex}"
  display_name        = "${var.VCN-DisplayName}-publicsubnet${random_id.uniqueString.hex}"
  cidr_block          = "10.0.0.0/24"
}
