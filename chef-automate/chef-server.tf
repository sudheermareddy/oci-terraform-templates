resource "oci_core_instance" "chefVM" {
    availability_domain = "${data.oci_identity_availability_domains.chefAD.availability_domains.0.name}"
    compartment_id = "${var.compId}"
    display_name="chef-server"
    //display_name = "${var.vcnDisplayName}-server${random_id.unq.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"

create_vnic_details {
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"
    display_name = "${var.nicName}"
    assign_public_ip = true
    private_ip = "10.0.0.3"
    hostname_label = "chef${random_id.unq.hex}"
}

metadata {
   ssh_authorized_keys = "${var.sshKey}" 
   user_data = "${base64encode(file(var.BootStrapFile1))}"
}
}


resource "null_resource" "remote-exec" {
  depends_on = ["oci_core_instance.chefVM"]
    provisioner "remote-exec" {
     connection {
        agent = false
       timeout = "15m"
       host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
       user = "ubuntu"
       private_key = "${(file(var.ssh_private_key))}"
     }
     inline = [
       "curl https://raw.githubusercontent.com/sudheermareddy/test/master/chefserver.sh > chefserver.sh",
       "chmod 777 chefserver.sh",
       "cat chefserver.sh | tr -d '\r' > newchef.sh",
       "chmod +x newchef.sh",
       "./newchef.sh"
     ]
   }
}