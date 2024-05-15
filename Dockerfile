from archlinux

expose 3389

run pacman -Syu --noconfirm 

run useradd -m container

run echo "container:a" | chpasswd

run echo "root:a" | chpasswd

CMD ["/usr/sbin/init"]
