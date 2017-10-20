#!/bin/sh

cd ~ubuntu

curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-splunk-enterprise/splunk-enetrprise/userdata/enable-password.sh > enable-password.sh

chmod +x enable-password-auth.sh