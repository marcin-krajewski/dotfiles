# paci         - install one or more packages
# pacu         - upgrade all packages to their newest version

packages=(vim vifm git termite zsh mc)

if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
  apt-get update
  ls packages | xargs -n 1 apt-get install
elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
  pacman -Syu
  pacman -S "${packages[@]}"
elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
  yum update
  yum install "${packages[@]}"
elif [ -e "/usr/local/bin/brew" ]; then # homebrew
  brew update
  brew install "${packages[@]}"
fi