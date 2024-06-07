from archlinux

expose 3388

run useradd -m container

run pacman -Syu --noconfirm 

run pacman -S --noconfirm git sudo base-devel

run echo "container ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

user container

workdir /home/container

run git clone https://aur.archlinux.org/yay.git

run cd yay && makepkg -si --noconfirm --needed

run echo "container:a" | chpasswd

run echo "root:a" | chpasswd

CMD ["/usr/sbin/init"]
