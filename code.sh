#!/usr/bin/env bash
pacman -Sy
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download          "
echo "-------------------------------------------------"
iso=$(curl -4 ifconfig.co/country-iso)
timedatectl set-ntp true
pacman -S --noconfirm pacman-contrib terminus-font
setfont ter-v22b
sed -i 's/^#Para/Para/' /etc/pacman.conf
pacman -S --noconfirm reflector rsync
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo -e "-------------------------------------------------------------------------"
echo -e "-Setting up $iso mirrors for faster downloads"
echo -e "-------------------------------------------------------------------------"

reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
mkdir /mnt

echo -e "\nInstalling prereqs...\n$HR"
pacman -S --noconfirm gptfdisk

echo "-------------------------------------------------"
echo "-------select your disk to format----------------"
echo "-------------------------------------------------"
lsblk
echo "Please enter disk to work on: (example /dev/sda)"
read DISK
echo "THIS WILL FORMAT AND DELETE ALL DATA ON THE DISK"
read -p "are you sure you want to continue (Y/N):" formatdisk
case $formatdisk in

y | Y | yes | Yes | YES)
	echo "--------------------------------------"
	echo -e "\nFormatting disk...\n$HR"
	echo "--------------------------------------"

	# disk prep
	sgdisk -n 1:0:+300MiB -t 1:ef00 -c 1:"EFIBOOT" ${DISK}
	sgdisk -n 2:0:+8GiB -t 0:2200 -c 2:"SWAP" ${DISK}
	sgdisk -n 3:0:+20GiB -t 3:8300 -c 3:"ROOT" ${DISK}
	sgdisk -n 4:0:0 -t 4:8300 -c 4:"HOME" ${DISK}

	echo -e "\nCreating Filesystems...\n$HR"

	if [[ ${DISK} =~ "nvme" ]]; then
		mkfs.vfat -F32 -n "EFIBOOT" "${DISK}p1"
		mkswap "${DISK}p2"
		swapon "${DISK}p2"
		mkfs.ext4 -L "ROOT" "${DISK}p3" -f
		mkfs.ext4 -L "HOME" "${DISK}p4" -f

		mount "${DISK}p3" /mnt
		mkdir -p /mnt/boot/efi
		mount -t vfat -L EFIBOOT /mnt/boot/
		mkdir -p /mnt/home
		mount "${DISK}p4" /mnt/home
	else
		mkfs.vfat -F32 -n "EFIBOOT" "${DISK}1"
		mkswap "${DISK}2"
		swapon "${DISK}2"
		mkfs.ext4 -n "ROOT" "${DISK}3"
		mkfs.ext4 -n "HOME" "${DISK}4"

		mount "${DISK}3" /mnt
		mkdir -p /mnt/boot/efi
		mount -t vfat -L EFIBOOT /mnt/boot/
		mkdir -p /mnt/home
		mount "${DISK}4" /mnt/home
	fi
	;;
esac

pacstrap -i /mnt base base-devel linux linux-headers vim bash-completion --noconfirm --needed
genfstab -U -p /mnt >>/mnt/etc/fstab

echo "--------------------------------------"
echo "--   SYSTEM READY FOR 1-setup       --"
echo "--------------------------------------"

arch-chroot /mnt

echo "-------------------------------------------------"
echo "       Setup Language to US and set locale       "
echo "-------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone Europe/London
timedatectl --no-ask-password set-ntp true
localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
# Set keymaps
localectl --no-ask-password set-keymap us

echo arch >/etc/hostname

# Add sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

systemctl enable fstrim.timer

pacman -Sy --noconfirm

systemctl enable fstrim.timer

echo -e "\nDone!\n"
if ! source install.conf; then
	read -p "Please enter username:" username
	echo "username=$username" >>${HOME}/test/install.conf
fi
if [ $(whoami) = "root" ]; then
	useradd -m -g users -G wheel,storage,power,libvirt -s /bin/bash $username
	passwd $username
	cp -R /root/test /home/$username/
	chown -R $username: /home/$username/test
	read -p "Please name your machine:" nameofmachine
	echo $nameofmachine >/etc/hostname
else
	echo "You are already a user proceed with aur installs"
fi

bootctl install

pacman -S --noconfirm intel-ucode

mkdir -p /boot/loader/entities
cp default.conf /boot/loader/enteries

echo "options root=PARTUUID=$(blkid -s PARTUUID -o value ${DISK}3) rw nvidia-drm.modeset=1" >>/boot/loader/enteries/default.conf

pacman -S networkmanager dkms broadcom-wl-dkms --noconfirm --needed

systemctl enable NetworkManager.service

# Graphics Drivers find and install
if lspci | grep -E "NVIDIA|GeForce"; then
	pacman -S nvidia-dkms nvidia-utils opencl-nvidia libglvnd lib32-libglvnd lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings --noconfirm --needed
elif lspci | grep -E "Radeon"; then
	pacman -S xf86-video-amdgpu --noconfirm --needed
elif lspci | grep -E "Integrated Graphics Controller"; then
	pacman -S libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils --needed --noconfirm
fi

if lspci | grep -E "NVIDIA|GeForce"; then
	sed -i 's/^MODULES=()/MODULES=(nvidia nvidia_modeset nvidia-uvm nvidia_drm)/' /etc/sudoers

	mkdir /etc/pacman.d/hooks
	cp nvidia /etc/pacman.d/hooks/nvidia

fi

pacman -S messa sddm xorg xorg-init awesome nitrogen picom vim alacritty firefox brave-bim --noconfirm --needed

systemctl enable sddm.service
