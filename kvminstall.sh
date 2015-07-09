LUID=$(id -u)
if [ $LUID -ne 0 ]; then
echo "$0 must be run as root"
exit 1
fi
if [ `egrep -c '(vmx|svm)' /proc/cpuinfo` = 0 ]; then
	echo "Sorry, but you have incompatable hardware"
	exit
fi
apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-manager
adduser `id -un` libvirtd
echo "Please log out and log back in. Then, you'll have KVM set up!"