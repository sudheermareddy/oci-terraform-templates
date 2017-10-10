resource "oci_core_instance" "linuxvm" {
    availability_domain = "${data.oci_identity_availability_domains.availdomain.availability_domains.0.name}"
    compartment_id = "${var.COMP-ID}"
    display_name = "${var.VCN-DisplayName}-linuxvm${random_id.uniqueString.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.subnet1.id}"
 create_vnic_details {
    subnet_id = "${oci_core_subnet.subnet1.id}"
    display_name = "vnic1"
    assign_public_ip = true
    hostname_label = "vm${random_id.uniqueString.hex}"
}
metadata {
   ssh_authorized_keys = "${var.InstancePublicKey}"
user_data = "${base64encode(file(var.BootStrapFile))}"
}
  }
