#!/bin/sh

dotfiles=(
gitconfig
tmux.conf
zshrc
vimrc
vim
)

echo "Loading package managers..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Backing up current configuration..."
today=`date +%Y%m%d`

for i in ${dotfiles[@]} ; do
  [ -e ~/.$i ] && [ ! -L ~/.$i ] && mv ~/.$i ~/.$i.bak.$today ;
  [ -L ~/.$i ] && unlink ~/.$i ;
done

echo "Symlink new files"
for i in ${dotfiles[@]} ; do
  ln -nsf ~/dotfiles/$i ~/.$i
done
