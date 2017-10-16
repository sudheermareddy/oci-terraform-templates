resource "oci_core_virtual_network" "VCN" {
  cidr_block = "${var.VCN-CIDR}"
  dns_label = "${var.VCN-DNSLabel}"
  compartment_id = "${var.COMP-ID}"
  display_name = "${var.VCN-DisplayName}"
}

