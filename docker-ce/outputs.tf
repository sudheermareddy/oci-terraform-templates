output "admin-username" {
  value = "${var.admin_username}"
}

output "admin-password" {
  value = "${var.admin_password}"
}

output "Manager_InstancePublicIP" {
  value = ["${oci_core_instance.linux-a.public_ip}"]
}

output "Manager_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-a.private_ip}"]
}
 
output "Worker_InstancePublicIP" {
  value = ["${oci_core_instance.linux-b.public_ip}"]
}

output "Worker_InstancePrivateIP" {
  value = ["${oci_core_instance.linux-b.private_ip}"]
}

