resource "oci_core_instance" "Clientvm" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-client-instance${random_id.uniqueString.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.Elksubnet1.id}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"

   }
 create_vnic_details {
    subnet_id = "${oci_core_subnet.Elksubnet1.id}"
    display_name = "clientnic"
    assign_public_ip = true
    hostname_label = "clientinstance"
  }
    }