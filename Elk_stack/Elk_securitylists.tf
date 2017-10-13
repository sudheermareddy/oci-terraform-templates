// create security rules
resource "oci_core_security_list" "ElksecurityRules" {
    compartment_id = "${var.compartment_id}"
    vcn_id = "${oci_core_virtual_network.ElkVcn.id}"
    display_name = "${var.VCN-DisplayName}-Elksecrules${random_id.uniqueString.hex}"
    
  egress_security_rules = [
    {
      protocol    = "all"
      destination = "0.0.0.0/0"
    }
  ]
  ingress_security_rules = [
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 22
        "max" = 12000
      }
    }
  ]
}