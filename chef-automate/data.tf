resource "random_id" "unq" {
  byte_length = 2
}

data "oci_identity_availability_domains" "chefAD" {
  compartment_id = "${var.compId}"
}

data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.compId}"
    operating_system = "${var.LinuxInstanceOS}"
    operating_system_version="${var.LinuxInstanceOSVersion}"
    }

data "oci_core_images" "WLImageOCID" {
    compartment_id = "${var.compId}"
    operating_system = "${var.WindowsInstanceOS}"
    operating_system_version="${var.WindowsInstanceOSVersion}"
    }

data "oci_objectstorage_namespace" "t" {
}

# Gets a list of vNIC attachments on the instance
data "oci_core_vnic_attachments" "InstanceVnicas" {
    compartment_id = "${var.compId}" 
    availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[0],"name")}"
    instance_id = "${oci_core_instance.chefVM.id}"
} 

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "InstanceVnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas.vnic_attachments[0],"vnic_id")}"
}    


# Gets a list of vNIC attachments on the instance
data "oci_core_vnic_attachments" "InstanceVnicas-2" {
    compartment_id = "${var.compId}" 
    availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[0],"name")}"
    instance_id = "${oci_core_instance.chefVM-2.id}"
} 

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "InstanceVnic-2" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas-2.vnic_attachments[0],"vnic_id")}"
}


# Gets a list of vNIC attachments on the instance
data "oci_core_vnic_attachments" "InstanceVnicas-3" {
    compartment_id = "${var.compId}" 
    availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[0],"name")}"
    instance_id = "${oci_core_instance.chefworkstation.id}"
} 

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "InstanceVnic-3" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas-3.vnic_attachments[0],"vnic_id")}"
}
