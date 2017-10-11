output "linux-a_InstancePublicIP" {
  value = ["${oci_core_instance.JenkinsInstance.public_ip}"]
}

output "linux-a_InstancePrivateIP" {
  value = ["${oci_core_instance.JenkinsInstance.private_ip}"]
}
