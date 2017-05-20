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
VBoxManage createhd --remember --filename /path/to/hard_drive_image/ubuntuclient.vdi --size 4096
VBoxManage createvm --register --name ubuntuserver --ostype ubuntu_64
VBoxManage modifyvm ubuntuclient --hda /path/to/hard_drive_image/ubuntuclient.vdi
VBoxManage modifyvm ubuntuclient --memory 1024
VBoxManage modifyvm ubuntuclient --dvd /path/to/installation_iso_file/ubuntuclient_64-DVD.iso
VBoxManage startvm ubuntuclient
VBoxManage modifyvm ubuntuclient --dvd none
echo "Configurtaion of client is done"
echo "Starting Virtual Machine"
VBoxManage startvm "Ubuntu client"
echo "Starting ssh coonection to the host virtual machine"
ssh host_name 


