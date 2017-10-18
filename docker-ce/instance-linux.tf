
resource "oci_core_instance" "linux-b" {
  count = "${var.instance_count}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-worker-${format("%02d", count.index + 1)}-b"
  image = "${lookup(data.oci_core_images.LinImageOCID.images[0], "id")}"
  shape = "${var.instanceShape}"
  create_vnic_details {
    subnet_id = "${oci_core_subnet.sub2.id}"
    display_name = "${var.prefix}-wor-${format("%02d", count.index + 1)}-nic-b"
    assign_public_ip = true
    hostname_label = "${var.prefix}-wor-${format("%02d", count.index + 1)}-b"
  },
  metadata {
    ssh_authorized_keys = "${var.sshPublicKey}"
    user_data = "${base64encode(format("%s\n%s %s %s\n",
           file(var.BootStrapFileDir),
           "./enable-password-auth.sh",
           "${var.admin_username}",
           "${var.admin_password}"
        ))}"
  }
}

resource "oci_core_instance" "linux-a" {
  count = "${var.instance_count}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-manager-${format("%02d", count.index + 1)}-a"
  image = "${lookup(data.oci_core_images.LinImageOCID.images[0], "id")}"
  shape = "${var.instanceShape}"
  create_vnic_details {
    subnet_id = "${oci_core_subnet.sub1.id}"
    display_name = "${var.prefix}-man-${format("%02d", count.index + 1)}-nic-a"
    assign_public_ip = true
    hostname_label = "${var.prefix}-man-${format("%02d", count.index + 1)}-a"
  },
  metadata {
    ssh_authorized_keys = "${var.sshPublicKey}"
    user_data = "${base64encode(format("%s\n%s %s %s\n",
           file(var.BootStrapFileDir),
           "./enable-password-auth.sh",
           "${var.admin_username}",
           "${var.admin_password}"
        ))}"
  }
}