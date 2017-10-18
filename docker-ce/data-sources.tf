data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_core_images" "LinImageOCID" {
    compartment_id = "${var.compartment_ocid}"
    operating_system = "${var.instanceLinOS}"
    operating_system_version = "${var.instanceLinOSVersion}"
}

data "oci_core_vnic_attachments" "linVnics-a" {
  compartment_id = "${var.compartment_ocid}" 
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  instance_id = "${oci_core_instance.linux-a.id}"
} 

data "oci_core_vnic" "lin-nic-a" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.linVnics-a.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic_attachments" "linVnics-b" {
  compartment_id = "${var.compartment_ocid}" 
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  instance_id = "${oci_core_instance.linux-b.id}"
} 

data "oci_core_vnic" "lin-nic-b" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.linVnics-b.vnic_attachments[0],"vnic_id")}"
}

