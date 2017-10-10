resource "oci_core_virtual_network" "chefvcn" {
  cidr_block = "${var.vcnCidr}"
  dns_label = "${var.DnsLabel}"
  compartment_id = "${var.compId}"
  display_name = "${var.vcnDisplayName}"
}

