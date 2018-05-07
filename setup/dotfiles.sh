#!/bin/sh


dotfiles=(
gitconfig
tmux.conf
zshrc
vimrc
vim
)

echo "Backing up current configuration..."
today=`date +%Y%m%d`

for i in ${dotfiles[@]} ; do
  [ -e ~/.$i ] && [ ! -L ~/.$i ] && mv ~/.$i ~/.$i.bak.$today ;
  [ -L ~/.$i ] && unlink ~/.$i ;
done

echo "Symlink new files"
for i in ${dotfiles[@]} ; do
  ln -s ~/dotfiles/$i ~/.$i
done
