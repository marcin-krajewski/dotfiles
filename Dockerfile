FROM archlinux

RUN pacman -Sy --noconfirm && pacman -S --noconfirm git

RUN git clone https://github.com/marcin-krajewski/dotfiles.git /root/dotfiles