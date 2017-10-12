// creating dhcp options
resource "oci_core_dhcp_options" "ELkdhcp-options" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network.ElkVcn.id}"
  display_name = "${var.VCN-DisplayName}-dhcpoptions${random_id.uniqueString.hex}"

// required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}
