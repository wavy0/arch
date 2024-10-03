from archlinux

expose 3388

run echo $(date)

run useradd -m container 

run echo "container:a" | chpasswd

run echo "root:a" | chpasswd

run pacman -Syu --noconfirm git sudo base-devel nano

run echo "container ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

user container

workdir /home/container

run echo "Build date of this image: $(date)" > ./README

run git clone https://aur.archlinux.org/yay.git

run cd yay && makepkg -si --noconfirm --needed

run yay -S --noconfirm --needed xrdp xorgxrdp

run rm -rf /home/container/yay

user root

CMD ["/usr/sbin/init"]
