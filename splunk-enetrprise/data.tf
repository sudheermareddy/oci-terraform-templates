data  "oci_identity_availability_domains" "availdomain" {
  compartment_id = "${var.COMP-ID}"
}

data "oci_core_images" "ImageOCID" {
    compartment_id = "${var.COMP-ID}"
    operating_system ="${var.InstanceOS}"
    operating_system_version =  "${var.InstanceOSVersion}"
}

data "oci_core_vnic_attachments" "splunkNic" {
  compartment_id = "${var.COMP-ID}" 
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  instance_id = "${oci_core_instance.splunkvm.id}"
} 

data "oci_core_vnic" "splunk-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.splunkNic.vnic_attachments[0],"vnic_id")}"
}
