resource "oci_core_instance" "chefVM" {
    availability_domain = "${data.oci_identity_availability_domains.chefAD.availability_domains.0.name}"
    compartment_id = "${var.compId}"
    display_name = "${var.vcnDisplayName}-VM${random_id.unq.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"

create_vnic_details {
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"
    display_name = "${var.nicName}"
    assign_public_ip = true
    hostname_label = "chef${random_id.unq.hex}"
}
metadata {
   ssh_authorized_keys = "${var.sshKey}"
}
}
