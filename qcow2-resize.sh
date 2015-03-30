#!/bin/bash
# this script is for resize qcow2 image
# sudo apt-get install libguestfs-tools -y --force-yes 2>/dev/null || sudo yum install -y libguestfs-tools
qemu-img create -f qcow2 $2 $3
virt-resize -d --expand /dev/sda1 $1 $2
qemu-img info $2
. /opt/stack/devstack/openrc admin admin
glance image-create --name=`basename $2 .qcow2` --store=file --disk-format=qcow2 --file=$2 --is-public=True --container-format=bare
