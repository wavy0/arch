from archlinux

expose 3388

run useradd -m container

run echo "container:a" | chpasswd

run echo "root:a" | chpasswd

run pacman -Syu --noconfirm git sudo base-devel

run echo "container ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

user container

workdir /home/container

run git clone https://aur.archlinux.org/yay.git

run cd yay && makepkg -si --noconfirm --needed

run yay -S --noconfirm --needed xrdp xorgxrdp

user root

CMD ["/usr/sbin/init"]
