#!/bin/sh
## taking.kr (webmaster@taking.kr)
## 2018-10-14
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
cd $HOME/Downloads/ && wget BrewFile https://gist.githubusercontent.com/taking/9d24f1dec98b779eac44ceab24f6b5d2/raw/5a14ba522a654427a83df5b65c2722c092b399f0/Brewfile
brew bundle Brewfile
echo 'Brewfile Package Installed OK!'
cat <<EOT >> /etc/shells
/usr/local/bin/zsh
EOT
echo '/usr/local/bin/zsh Added OK!'
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
