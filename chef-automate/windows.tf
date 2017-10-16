resource "oci_core_instance" "windowsInstance" {
  availability_domain = "${data.oci_identity_availability_domains.chefAD.availability_domains.1.name}"
  compartment_id = "${var.compId}"
  display_name = "ooha-chefWindowsServer"
  image = "${lookup(data.oci_core_images.wOLImageOCID.images[0], "id")}"
  shape = "${var.InstanceShape}"
  subnet_id = "${oci_core_subnet.chefsubnet1.id}"
  hostname_label = "winmachine"
  metadata {}
}
