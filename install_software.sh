# paci         - install one or more packages
# pacu         - upgrade all packages to their newest version

packages=(vim vifm git termite zsh mc)

if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
  sudo apt-get update
  sudo apt-get install "${packages[@]}"
elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
  sudo pacman -Syu
  sudo pacman -S "${packages[@]}"
elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
  sudo yum update
  sudo yum install "${packages[@]}"
elif [ -e "/usr/local/bin/brew" ]; then # homebrew
  sudo brew update
  sudo brew install "${packages[@]}"
fi