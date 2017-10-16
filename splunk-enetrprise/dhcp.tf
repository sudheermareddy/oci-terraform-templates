// creating dhcp options
resource "oci_core_dhcp_options" "dhcp-options" {
  compartment_id = "${var.COMP-ID}"
  vcn_id = "${oci_core_virtual_network.VCN.id}"
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


  


