# `dotfiles`
no fluff, just dotfiles

- kakoune
- oh-my-zsh
- rbenv
- pyenv

```bash
mkdir -p ~/.config/kak/plugins
mkdir -p ~/.local/bin
```

symlinks
```bash
ln -s {dotfiles}/zshrc ~/.zshrc
ln -s {dotfiles}/gitconfig ~/.gitconfig
ln -s {dotfiles}/gitignore ~/.gitignore

ln -s {dotfiles}/kakrc ~/.config/kak/kakrc
ln -s {dotfiles}/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
```

## Ruby
```bash
sudo rm -rf $HOME/.rbenv /usr/local/rbenv /opt/rbenv /usr/local/opt/rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src # Optionally compile ruby for faster performance
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Confirm installation
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

rbenv install "$(cat .ruby-version)"
rbenv global "$(cat .ruby-version)"
```

### Mac

```bash
xcode-select --install

sudo rm -rf /usr/local/Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git screen kakoune tmux libressl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/fire-pls/df.git
zsh ./df/macos.sh
```
