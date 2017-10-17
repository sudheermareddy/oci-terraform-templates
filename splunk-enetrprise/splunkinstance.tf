
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
resource "null_resource" "remote-exec0" {
    depends_on = ["oci_core_instance.splunkvm"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "5m"
        host = "${data.oci_core_vnic.splunk-nic.public_ip_address}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-splunk-enterprise/splunk-enetrprise/userdata/splunk-install.sh ",
        "chmod 777 splunk-install.sh",
        "./splunk-install.sh ${var.admin_username} >> remote-exec.log 2>&1"


      ]
    }
}


