resource "oci_core_virtual_network" "vcn1" {
  cidr_block = "10.1.0.0/16"
  dns_label = "vcnash${random_id.unq.hex}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "vcnash${random_id.unq.hex}"
}