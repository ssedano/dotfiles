#!/usr/bin/env zsh
mv ~/.zshrc ~/.zshrc_old
mv ~/.aliases ~/.aliases_old
mv ~/.zshenv ~/.zshenv_old
mv ~/.functions ~/.functions_old
mv ~/.vimrc ~/.vimrc_old
mv ~/.vim ~/.vim_old
mv ~/.gitconfig ~/.gitconfig_old
mv ~/.gitignore ~/.gitignore_old
mv ~/.zsh ~/.zsh_old

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/aliases ~/.aliases
ln -s ~/dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/dotfiles/zsh/functions ~/.functions
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore
ln -s ~/dotfiles/zsh ~/.zsh

mkdir ~/.oh-my-zsh/custom/themes 2> /dev/null
ln -s ~/dotfiles/zsh/themes/ssedano.zsh-theme ~/.oh-my-zsh/ssedano.zsh-theme
source ~/.zshrc
