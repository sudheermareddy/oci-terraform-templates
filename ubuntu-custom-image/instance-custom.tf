resource "oci_core_instance" "cbox" {
  depends_on = ["oci_core_image.img"]
  count = "${var.instance_count}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "custom_box${count.index}_${random_id.unq.hex}"
  image = "${oci_core_image.img.id}"
  shape = "${var.InstanceShape}"
  create_vnic_details {
    subnet_id = "${element(oci_core_subnet.sub.*.id, count.index)}"
    display_name = "vnic${count.index}${random_id.unq.hex}"
    assign_public_ip = true
    hostname_label = "custombox${count.index}${random_id.unq.hex}"
  },
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.BootStrapFile))}"
  }
}