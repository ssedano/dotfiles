#!/usr/bin/env zsh
[[ ( -f ~/.zshrc || -h ~/.zshrc ) ]] && mv ~/.zshrc ~/.zshrc_old
[[ ( -f ~/.aliases || -h ~/.aliases ) ]] && mv ~/.aliases ~/.aliases_old
[[ ( -f ~/.zshenv || -h ~/.zshenv ) ]] && mv ~/.zshenv ~/.zshenv_old
[[ ( -f ~/.functions || -h ~/.functions ) ]] && mv ~/.functions ~/.functions_old
[[ ( -f ~/.vimrc || -h ~/.vimrc ) ]] && mv ~/.vimrc ~/.vimrc_old
[[ ( -d ~/.vim || -h ~/.vim ) ]] && rm -rf ~/.vim_old &&  mv -f ~/.vim ~/.vim_old
[[ ( -f ~/.gitconfig || -h ~/.gitconfig ) ]] && mv ~/.gitconfig ~/.gitconfig_old
[[ ( -f ~/.gitignore || -h ~/.gitignore ) ]] && mv ~/.gitignore ~/.gitignore_old
[[ ( -d ~/.zsh || -h ~/.zsh ) ]] && rm -rf ~/.zsh_old &&  mv -f ~/.zsh ~/.zsh_old
[[ ( -f ~/.mplayerrc || -h ~/.mplayerrc ) ]] && mv ~/.mplayerrc ~/.mplayerrc_old
[[ ( -f ~/.lein/profiles.clj || -h ~/.lein/profiles.clj ) ]] && mv ~/.lein/profiles.clj ~/.lein_profiles_old

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/aliases ~/.aliases
ln -s ~/dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/dotfiles/zsh/functions ~/.functions
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/mplayer/mplayerrc ~/.mplayerrc
ln -s ~/dotfiles/lein/profiles.clj ~/.lein/profiles.clj

ln -sf ~/dotfiles/zsh/themes/ssedano.zsh-theme ~/.oh-my-zsh/custom/ssedano.zsh-theme
source ~/.zshrc

