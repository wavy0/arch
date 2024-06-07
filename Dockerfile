from archlinux

expose 3388

run pacman -Syu --noconfirm 

run pacman -S --noconfirm git sudo base-devel

run git clone https://aur.archlinux.org/yay.git

run cd yay

run makepkg -si --noconfirm --needed

run useradd -m container

run echo "container:a" | chpasswd

run echo "container ALL=(ALL:ALL) ALL" >> /etc/sudoers

run echo "root:a" | chpasswd

CMD ["/usr/sbin/init"]
