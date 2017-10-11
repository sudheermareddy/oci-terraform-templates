resource "oci_core_instance" "JenkinsInstance" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "JenkinsInstance"
  image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
  shape = "${var.InstanceShape}"
  subnet_id = "${oci_core_subnet.subnet.id}"
  
  create_vnic_details {
    subnet_id = "${oci_core_subnet.subnet.id}"
    display_name = "jenkinsvnic"
    assign_public_ip = true
    hostname_label="jenkinsvm"
  }
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.BootStrapFile))}"    
  }

  timeouts {
    create = "60m"
  }
}