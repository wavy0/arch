from archlinux

expose 3389

expose 3388

run pacman -Syu --noconfirm 

run pacman -S --noconfirm git sudo base-devel

run useradd -m container

run echo "container:a" | chpasswd

run echo "container ALL=(ALL:ALL) ALL" >> /etc/sudoers

run echo "root:a" | chpasswd

CMD ["/usr/sbin/init"]
