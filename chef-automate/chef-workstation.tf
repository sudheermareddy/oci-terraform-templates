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
metadata {
  #user_data = "${base64encode(file(var.chef-windowsvm))}"
}
}

#resource "null_resource" "remote-exec3" {
# depends_on = ["oci_core_instance.windowsInstance"]
#    provisioner "remote-exec" {
#     connection {
#        agent = false
#        type  = "winrm"
#        user = "129.213.42.169/opc"
#        password = "Password@123"
#       timeout = "5m"
#       host = "${data.oci_core_vnic.InstanceVnic-3.public_ip_address}"
#     }
#     inline = [
#       "mkdir c:/Users/opc/AppData/Roaming/yogi",
#       "mkdeir c:/yogi",
#       "Invoke-WebRequest -Uri https://raw.githubusercontent.com/sudheermareddy/test/master/ws1.ps1  -OutFile C:/Users/opc/AppData/Roaming/ws1.ps1",
#       "cd c:/Users/opc/AppData/Roaming",
#       "./ws1.ps1"
#     ]
#   }
#}