resource "oci_core_security_list" "nsl1" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "${var.prefix}-nsl"
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
        "max" = 22
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 80
        "max" = 80
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 443
        "max" = 443
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 2377
        "max" = 2377
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 7946
        "max" = 7946
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 4789
        "max" = 4789
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 5000
        "max" = 5000
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 5001
        "max" = 5001
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 8080
        "max" = 8080
      }
    }

  ]
}