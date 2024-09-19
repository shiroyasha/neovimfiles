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

asdf install erlang 25.0.4
asdf install elixir 1.14.0-otp-25

asdf global erlang 25.0.4
asdf global elixir 1.14.0-otp-25

git clone git@github.com:elixir-lsp/elixir-ls.git ~/.elixir-ls
cd ~/.elixir-ls
mix deps.get
mix deps.update --all
mix compile && mix elixir_ls.release -o release

mix local.rebar --force
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
