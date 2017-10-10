resource "oci_core_dhcp_options" "dhcp-options1" {
  compartment_id = "${var.COMP-ID}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "${var.VCN-DisplayName}-dhcpoptions${random_id.uniqueString.hex}"

// required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type = "SearchDomain"
    search_domain_names = [ "${var.SearchDomain}" ]
  }
}
