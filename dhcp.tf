resource "oci_core_dhcp_options" "chefdhcp" {
  compartment_id = "${var.compId}"
  vcn_id = "${oci_core_virtual_network.chefvcn.id}"
  display_name = "${var.vcnDisplayName}-chefdhcp${random_id.unq.hex}"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type = "SearchDomain"
    search_domain_names = [ "chefautomate.oraclevcn.com" ]
}
}
