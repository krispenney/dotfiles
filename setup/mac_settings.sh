#!/bin/sh

curl -L https://iterm2.com/misc/install_shell_integration_and_utilities.sh | bash

git clone git@github.com:powerline/fonts.git ~/fonts-delete && ~/fonts-delete/install.sh && rm -rf ~/fonts-delete
