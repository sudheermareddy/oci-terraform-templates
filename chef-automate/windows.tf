resource "oci_core_instance" "windowsInstance" {
depends_on = ["oci_core_instance.chefVM-server"]
  availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[1],"name")}"
  compartment_id = "${var.compId}"
  display_name = "ooha-chefWindowsServer"
  image = "${lookup(data.oci_core_images.wImageOCID.images[0], "id")}"
  shape = "${var.InstanceShape}"
  subnet_id = "${oci_core_subnet.chefsubnet1.id}"
  hostname_label = "winmachine"
  metadata {
    user_data = "${base64encode(file(var.BootStrapFile1))}"
  }
}