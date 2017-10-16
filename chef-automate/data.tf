resource "random_id" "unq" {
  byte_length = 2
}

data "oci_identity_availability_domains" "chefAD" {
  compartment_id = "${var.compId}"
}

data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.compId}"
    operating_system = "${var.InstanceOS}"
    operating_system_version="${var.InstanceOSVersion}"
    }
data "oci_core_images" "wImageOCID" {
  compartment_id = "${var.compId}"
  operating_system = "${var.wInstanceOS}"
  operating_system_version = "${var.wInstanceOSVersion}"
}
data "oci_core_vnic_attachments" "InstanceVnicas" {
    compartment_id = "${var.compId}" 
    availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[0],"name")}"
    instance_id = "${oci_core_instance.chefVM-server.id}"
} 
data "oci_core_vnic" "InstanceVnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas.vnic_attachments[0],"vnic_id")}"
}
