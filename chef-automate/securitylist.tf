resource "oci_core_security_list" "chefsecurity" {
    compartment_id = "${var.compId}"
    vcn_id = "${oci_core_virtual_network.chefvcn.id}"
    display_name = "${var.vcnDisplayName}-security${random_id.unq.hex}"

    egress_security_rules =[
        {
            protocol = "all"
            destination = "0.0.0.0/0"
        }
    ]


// allow inbound tcp traffic on all ports
       ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" = 80
            "max" = 80
        }
    }
      ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" = 443
            "max" = 443
        }
    }
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" =8989
            "max" =8989
        }
    },
    ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 22
                "max" = 22
            }
        },
        ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 3389
                "max" = 3389
            }
        },
        ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 5985
                "max" = 5985
            }
        }

}