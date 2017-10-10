   resource "oci_core_instance" "chefCustomImage" {
    availability_domain = "${data.oci_identity_availability_domains.chefAD.availability_domains.0.name}"
    compartment_id = "${var.compId}"
    display_name = "${var.vcnDisplayName}-CustomImage${random_id.unq.hex}"
    image = "${oci_core_image.chefCustomImage.id}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"

create_vnic_details {
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"
    display_name = "customnic"
    assign_public_ip = true

     hostname_label = "chefCustomImage${random_id.unq.hex}"
}
metadata {
   ssh_authorized_keys = "${var.sshKey}"
}
}
