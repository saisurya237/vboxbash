#! /usr/bin

echo "removing old version of virtualbox....Please wait"
sudo apt-get purge virtualbox
echo "adding repository of virtual box into sources list..."
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
echo "adding public keys to verify downloads..please wait.."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "updating to complete the process of adding the repository"
sudo apt update
echo "installing dkms "
sudo apt install dkms
echo "installing virtualbox"
sudo apt install virtualbox
echo "install vbox extention pack"
vboxmanage extpack install
echo "Installing os"
VM='Ubuntu-server-64bit'
VBoxManage createhd --remember --filename /path/to/hard_drive_image/ubuntuserver.vdi --size 4096
VBoxManage createvm --register --name ubuntuserver --ostype ubuntu_64
VBoxManage modifyvm ubuntuserver --hda /path/to/hard_drive_image/ubuntuserver.vdi
VBoxManage modifyvm ubuntuserver --memory 1024
VBoxManage modifyvm ubuntuserver --dvd /path/to/installation_iso_file/ubuntuserver_64-DVD.iso
VBoxManage startvm ubuntuserver
VBoxManage modifyvm ubuntuserver --dvd none
echo "Configurtaion of server is done"
echo "Starting Virtual Machine"
VBoxManage startvm "Ubuntu Server"
echo "Starting ssh server on the host virtual machine"
sudo systemctl start ssh 
echo "Status of ssh server"
sudo systemctl status ssh

