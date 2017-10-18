resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.linux-a"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.lin-nic-a.public_ip_address}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ce/docker-ce/userdata/docker-ce-install.sh > docker-ce-install.sh",
        "chmod +x docker-ce-install.sh",
        "./docker-ce-install.sh ${var.admin_username} >> remote-exec.log 2>&1"
      ]
    }
}

resource "null_resource" "remote-exec2" {
    depends_on = ["oci_core_instance.linux-b"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.lin-nic-b.public_ip_address}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ce/docker-ce/userdata/docker-ce-install.sh > docker-ce-install.sh",
        "chmod +x docker-ce-install.sh",
        "./docker-ce-install.sh ${var.admin_username} >> remote-exec.log 2>&1"
      ]
    }
}
