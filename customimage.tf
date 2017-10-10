resource "oci_core_image" "chefCustomImage" {
    compartment_id = "${var.compId}"
    display_name = "${var.vcnDisplayName}-CustomImage${random_id.unq.hex}"
    instance_id = "${oci_core_instance.chefVM.id}"
    timeouts {
    create = "30m"
   }
}
