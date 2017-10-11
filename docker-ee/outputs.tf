output "vm-admin-username" {
  value = "${var.admin_username}"
}

output "vm-admin-password" {
  value = "${var.admin_password}"
}

output "Workstation_InstancePublicIP" {
  value = ["${oci_core_instance.linux-a.public_ip}"]
}

output "Worker_01_InstancePublicIP" {
  value = ["${element(oci_core_instance.linux-b.*.public_ip, 0)}"]
}

output "Worker_01_InstancePrivateIP" {
  value = ["${element(oci_core_instance.linux-b.*.private_ip, 0)}"]
}

output "Worker_02_InstancePublicIP" {
  value = ["${element(oci_core_instance.linux-b.*.public_ip, 1)}"]
}

output "Worker_02_InstancePrivateIP" {
  value = ["${element(oci_core_instance.linux-b.*.private_ip, 1)}"]
}

output "Manager_InstancePublicIP" {
  value = ["${oci_core_instance.linux-c.public_ip}"]
}

output "Manager_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-c.private_ip}"]
}