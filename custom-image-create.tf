resource "oci_core_image" "img" {
    depends_on = ["oci_core_instance.vbox"]
    count = "${var.instance_count}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "custom_image${count.index}_${random_id.unq.hex}"
    instance_id = "${element(oci_core_instance.vbox.*.id, count.index)}"
    timeouts {
 	      create = "60m"
 	  }
}