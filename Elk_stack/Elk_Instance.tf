resource "oci_core_instance" "Elkvm" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-ELK-instance${random_id.uniqueString.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.Elksubnet1.id}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  create_vnic_details {
    subnet_id = "${oci_core_subnet.Elksubnet1.id}"
    display_name = "ELknic"
    assign_public_ip = true
    hostname_label = "ELKinstance"
  }
}
resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.Elkvm"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.elk-nic.public_ip_address}"
        user = "elastic"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~elastic",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/userdata/elkstack_kibana.sh > elkstack_kibana.sh ",
        "chmod +x elkstack_kibana.sh",
        "./elkstack_kibana.sh"
      ]
    }
}

data "oci_core_vnic_attachments" "elknic" {
 compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  instance_id = "${oci_core_instance.Elkvm.id}"
} 

data "oci_core_vnic" "elk-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.elknic.vnic_attachments[0],"vnic_id")}"
}
