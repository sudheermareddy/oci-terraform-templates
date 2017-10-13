#!/bin/sh

cd ~ubuntu

curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ee/docker-ee/userdata/enable-password-auth.sh > enable-password-auth.sh

chmod +x enable-password-auth.sh
