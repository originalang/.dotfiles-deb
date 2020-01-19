#--------#
# Colors #
#--------#
RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[0;30m'
LIGHTRED='\033[0;31m'
LIGHTGREEN='\033[0;32m'
YELLOW='\033[0;33m'
LIGHTBLUE='\033[0;34m'
LIGHTPURPLE='\033[0;35m'
LIGHTCYAN='\033[0;36m'
WHITE='\033[0;37m'


#-----------------------#
# installation function #
#-----------------------#
install() {
	PACKAGE="$1"

	if dpkg -s $PACKAGE >/dev/null 2>&1
	then
		echo "\n${LIGHTCYAN}$PACKAGE already installed, moving on...${RESET}";
	else
		echo -n "\n${YELLOW}Should I install ${LIGHTPURPLE}$PACKAGE${RESET}? (y/n) ";
		read CHOICE;
		case $CHOICE in
			[Yy]* )
				echo "\n${LIGHTGREEN}Installing ${YELLOW}$PACKAGE...";
				sudo apt-get install -qq $PACKAGE > /dev/null

				if [ $? -eq 0 ]; then
					echo "${GREEN}😄${YELLOW}$PACKAGE ${RESET}installed";
				else
					echo "${RED}⚠️ There was an error while installing ${YELLOW}$PACKAGE"
				fi

				break;;

			[Nn]* )
				echo "${BLUE}👍 ${RESET}Skipping $PACKAGE";
				break;;
		esac
	fi
}


#----------------------#
# package installation #
#----------------------#
install vim
install zsh
install tree
install htop
install imagemagick
install nodejs
install npm
install fonts-hack

#-------------------#
# zsh configuration #
#-------------------#
if [ $(which zsh) ]
then
	# install Oh My Zsh to use with zsh
	# this will also set zsh as the default shell
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


#----------------------#
# system configuration #
#----------------------#

# get dotfiles installallation directory
CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# generate symlinks
ln -sf "$CURRENT_DIR/.zshrc" ~
ln -sf "$CURRENT_DIR/.bashrc" ~
ln -sf "$CURRENT_DIR/.vimrc" ~
