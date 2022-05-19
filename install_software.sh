# paci         - install one or more packages
# pacu         - upgrade all packages to their newest version

packages=(vim vifm git termite zsh mc)

function _update() {
  echo "Update software repositories"
  if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
    apt-get update
  elif [ -e "/usr/bin/yay" ]; then # Arch Linux
    yay -Syu
  elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
    pacman -Syu
  elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
    yum update
  elif [ -e "/usr/local/bin/brew" ]; then # homebrew
    brew update
  fi
}

function _install() {
  package=$1
  echo " > Installing package $package"
  if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
    apt-get install $package
  elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
    pacman -S $package
  elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
    yum install $package
  elif [ -e "/usr/local/bin/brew" ]; then # homebrew
    brew install $package
  fi
}

_update
_install yay
_install vim
_install vifm
_install git
_install termite
_install zsh
_install mc
_install mc
_install rofi

echo "************************************************************************************************************************"
echo "*                                                                                                                      *"
echo "*               Add your additional config/installation files here, it will be performed on image build                *"
echo "*                                                                                                                      *"
echo "************************************************************************************************************************"

#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

cd ~

if [ ! -d ".zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  ln -fs .zprezto/runcoms/zlogin .zlogin
  ln -fs .zprezto/runcoms/zlogout .zlogout
  ln -fs .zprezto/runcoms/zpreztorc .zpreztorc
  ln -fs .zprezto/runcoms/zprofile .zprofile
  ln -fs .zprezto/runcoms/zshenv .zshenv
  ln -fs .zprezto/runcoms/zshrc .zshrc

  chsh -s /bin/zsh
fi

