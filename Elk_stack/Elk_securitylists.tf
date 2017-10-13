// create security rules
resource "oci_core_security_list" "ElksecurityRules" {
    compartment_id = "${var.compartment_id}"
    vcn_id = "${oci_core_virtual_network.ElkVcn.id}"
    display_name = "${var.VCN-DisplayName}-Elksecrules${random_id.uniqueString.hex}"
      // allow outbound tcp traffic on all ports
        egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
                }
                 // allow inbound ssh traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false


    tcp_options {
                "min" = 22
                "max" = 22
                }
                }
                 // allow inbound ssh traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false


    tcp_options {
                "min" = 80
                "max" = 80
                }
                }
                 // allow inbound ssh traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false
  tcp_options {
                "min" = 9200
                "max" = 9200
                }
               }
               ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false
  tcp_options {
                "min" = 5601
                "max" = 5601
                }
               }
                // allow inbound ssh traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false


    tcp_options {
                "min" = 5044
                "max" = 5044
                }
                }
}
