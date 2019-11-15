#!/bin/sh
cat <<EOT > /etc/resolv.conf
# Google DNS
nameserver 8.8.8.8
nameserver 8.8.4.4
EOT
echo 'DNS Changed OK!'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
echo 'Homebrew Installed OK!'
echo 'Brewfile Package Installing..'
cd $HOME/Downloads/ && wget BrewFile https://raw.githubusercontent.com/SungIk-Park/my-init-mac-script/master/Brewfile
brew bundle Brewfile
echo 'Brewfile Package Installed OK!'
cat <<EOT >> /etc/shells
/usr/local/bin/zsh
EOT
echo '/usr/local/bin/zsh Added OK!'

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

chsh -s `which zsh`
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/powerline/fonts.git && ./fonts/install.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
echo 'zsh Installed OK!'
cd $HOME && mv .zshrc .zshrc_backup
wget https://gist.githubusercontent.com/taking/1a03b19d580dda6376300d865b19b443/raw/db6dfe56088d8f12810da874b6f6d68108671275/.zshrc
echo 'oh-my-zsh Installed OK!'
source ~/.zshrc
