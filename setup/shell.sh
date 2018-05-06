#!/bin/sh
echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

mkdir "$ZSH"/z
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -P "$ZSH"/z

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
