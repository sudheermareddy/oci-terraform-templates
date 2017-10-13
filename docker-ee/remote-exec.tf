resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.linux-c"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.lin-nic-c.public_ip_address}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ee/docker-ee/userdata/docker-install-ucp.sh > docker-install-ucp.sh",
        "chmod +x docker-install-ucp.sh",
        "./docker-install-ucp.sh ${var.admin_username} ${var.docker_ee_url} ${data.oci_core_vnic.lin-nic-c.private_ip_address} ${data.oci_core_vnic.lin-nic-c.public_ip_address} >> remote-exec.log 2>&1"
      ]
    }
}

resource "null_resource" "remote-exec2" {
    depends_on = ["oci_core_instance.linux-b1"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.lin-nic-b1.public_ip_address}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ee/docker-ee/userdata/docker-install.sh > docker-install.sh",
        "chmod +x docker-install.sh",
        "./docker-install.sh ${var.admin_username} ${var.docker_ee_url} >> remote-exec.log 2>&1"

      ]

    }
}

/*resource "null_resource" "remote-exec3" {
    depends_on = ["oci_core_instance.linux-b2"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.lin-nic-b2.public_ip_address}"
        user = "${var.admin_username}r"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/ashwinse/test-base/master/docker-install.sh > docker-install.sh",
        "chmod +x docker-install.sh",
        "./docker-install.sh ${var.admin_username} ${var.docker_ee_url}"

      ]

    }
}*/

resource "null_resource" "remote-exec3" {
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
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ee/docker-ee/userdata/docker-install.sh > docker-install.sh",
        "chmod +x docker-install.sh",
        "./docker-install.sh ${var.admin_username} ${var.docker_ee_url} >> remote-exec.log 2>&1"

      ]

    }
}
