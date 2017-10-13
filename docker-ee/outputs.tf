output "admin-username" {
  value = "${var.admin_username}"
}

output "admin-password" {
  value = "${var.admin_password}"
}

output "Workstation_InstancePublicIP" {
  value = ["${oci_core_instance.linux-a.public_ip}"]
}

output "Workstation_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-a.private_ip}"]
}

output "Worker_01_InstancePublicIP" {
  value = ["${oci_core_instance.linux-b1.public_ip}"]
}

output "Worker_01_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-b1.private_ip}"]
}

/*output "Worker_02_InstancePublicIP" {
  value = ["${oci_core_instance.linux-b2.public_ip}"]
}

output "Worker_02_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-b2.private_ip}"]
}*/

output "Manager_InstancePublicIP" {
  value = ["${oci_core_instance.linux-c.public_ip}"]
}

output "Manager_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-c.private_ip}"]
}