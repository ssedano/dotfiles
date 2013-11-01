#!/usr/bin/env zsh
mv ~/.zshrc ~/.zshrc_old
mv ~/.aliases ~/.aliases_old
mv ~/.zshenv ~/.zshenv_old
mv ~/.functions ~/.functions_old
mv ~/.vimrc ~/.vimrc_old
mv ~/.vim ~/.vim_old
mv ~/.gitconfig ~/.gitconfig_old

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/aliases ~/.aliases
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/functions ~/.functions
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/gitconfig ~/.gitconfig
source ~/.zshenv
