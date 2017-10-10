resource "oci_core_instance" "vbox" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "linux_box_${random_id.unq.hex}"
  image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
  shape = "${var.InstanceShape}"
  create_vnic_details {
    subnet_id = "${element(oci_core_subnet.sub.*.id, 0)}"
    display_name = "vnic_${random_id.unq.hex}"
    assign_public_ip = true
    hostname_label = "linuxbox${random_id.unq.hex}"
  },
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.BootStrapFile))}"
  }
}