resource "oci_core_virtual_network" "vcn1" {
  cidr_block = "10.1.0.0/16"
  dns_label = "${var.prefix}doc"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-vcn"
}