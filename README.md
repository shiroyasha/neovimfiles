# Neovim Files

Set up codepilot:

```
:Copilot auth
:Copilot enable
```

Typescript setup:

```
npm install -g typescript typescript-language-server
npm install -g @tailwindcss/language-server
npm install -g prettier
```

Elixir:

```
sudo apt-get install libssl-dev automake autoconf libncurses5-dev

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 27.1
asdf install elixir 1.17.0-otp-27

asdf global erlang 25.0.4
asdf global elixir 1.17.0-otp-27
```

Install the LSP server

```
mkdir -p ~/code/lexical-lsp
git clone git@github.com:lexical-lsp/lexical.git ~/code/lexical-lsp/lexical
cd ~/code/lexical-lsp/lexical
mix deps.get
mix package
```

# Install NeoVim from source

Prerequisites:

```
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
```

```
cd /tmp
wget https://github.com/neovim/neovim/archive/refs/tags/v0.10.1.tar.gz -O nvim.tar.gz
tar -xzvf nvim.tar.gz
cd neovim-0.10.1
make CMAKE_BUILD_TYPE=Release
sudo make install
```

# Install ripgrep

Necessary for telescope:

```
sudo apt-get install ripgrep
```
