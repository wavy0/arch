from archlinux

expose 3388

run useradd -m container

run pacman -Syu --noconfirm 

run pacman -S --noconfirm git sudo base-devel

user container

workdir /home/container

run git clone https://aur.archlinux.org/yay.git

run dir

run makepkg -si --noconfirm --needed

run echo "container:a" | chpasswd

run echo "container ALL=(ALL:ALL) ALL" >> /etc/sudoers

run echo "root:a" | chpasswd

CMD ["/usr/sbin/init"]
