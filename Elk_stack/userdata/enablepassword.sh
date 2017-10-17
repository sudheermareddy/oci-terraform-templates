
#!/bin/sh

cd ~ubuntu

curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/userdata/enablepasswordelkvm.sh > enablepasswordelkvm.sh

chmod +x enablepasswordelkvm.sh