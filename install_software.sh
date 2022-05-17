# paci         - install one or more packages
# pacu         - upgrade all packages to their newest version

if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
  aptget="/usr/bin/apt-get"
  sudoaptget="sudo $aptget"
  alias paci="$sudoaptget install"
  alias pacu="$sudoaptget update"
elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
  pacman="/usr/bin/pacman"
  sudopacman="sudo $pacman"
  alias paci="$pacman -S"
  alias pacu="$pacman -Syu"
elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
  yum="/usr/bin/yum"
  sudoyum="sudo $yum"
  alias paci="$sudoyum install"
  alias pacu="$sudoyum update"
elif [ -e "/usr/local/bin/brew" ]; then # homebrew
  brew="/usr/local/bin/brew"
  alias paci="$brew install"
  alias pacu="$brew update"
fi


pacu
paci vim vifm git termite mc