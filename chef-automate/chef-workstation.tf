resource "oci_core_instance" "chefworkstation" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[0],"name")}"
    compartment_id = "${var.compId}"
    display_name = "Chef-Workstation"
    image = "${lookup(data.oci_core_images.WLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"

create_vnic_details {
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"
    display_name = "${var.nicName}"
    assign_public_ip = true
    hostname_label = "winmachine"    
}
metadata {}
}
