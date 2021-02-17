# init.vim
My Neovim config files go here

## Dependencies
	1. Vim-plug
	2. Nerd fonts (optional)
	3. Linterers for syntastic(optional)

## Installation

Copy these files(init.vim) into ~/.config/nvim

Install vim-plug using(it is better to check their website for installation):
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then run, `nvim +PlugInstall +qall` on terminal
