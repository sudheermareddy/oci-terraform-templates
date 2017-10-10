resource "oci_core_security_list" "publicsgl" {
    compartment_id = "${var.COMP-ID}"
    vcn_id = "${oci_core_virtual_network.vcn1.id}"
    display_name = "${var.VCN-DisplayName}-publicsgl${random_id.uniqueString.hex}"

        // allow outbound tcp traffic on all ports
        egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
                }

        // allow outbound udp traffic on a port range
        egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "17" // udp
        stateless = true

        udp_options {
                "min" = 319
                "max" = 320
                }
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
        // allow inbound icmp traffic of a specific type
        ingress_security_rules {
        protocol  = 1
        source    = "0.0.0.0/0"
        stateless = true

        icmp_options {
                "type" = 3
   "code" = 4
                }
                }
        // allow inbound http traffic of a specific type
        ingress_security_rules {
        protocol = "80" // tcp
        source = "0.0.0.0/0"
        stateless = false

        tcp_options {
                "min" = 80
                "max" = 80
                }
                }

        }
