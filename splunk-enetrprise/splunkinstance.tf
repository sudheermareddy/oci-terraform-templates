
resource "oci_core_instance" "splunkvm" {
    availability_domain = "${data.oci_identity_availability_domains.availdomain.availability_domains.0.name}"
    compartment_id = "${var.COMP-ID}"
    display_name = "splunkvm${random_id.uniqueString.hex}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.subnet1.id}"
     image = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        
  }
 create_vnic_details {
   subnet_id = "${oci_core_subnet.subnet1.id}"
     display_name = "splunknic"
    assign_public_ip = true
    hostname_label = "instance"
  }
    }

