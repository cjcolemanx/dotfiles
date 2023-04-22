export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':completion:*' menu select  # completion menu
bindkey -v

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

HISTFILE=~/.histfile
HISTSIZE=1000

setopt autocd

neofetch

plugins=(
  # dirhistory               # keyboard directory traversal
  # jsontools                # prettify json data
  # npm                      # common npm aliases
  # nvm                      # autocomplete for nvm
  #zsh-navigation-tools     # mostly useless set of tools for zsh
  python                   # python aliases and commands
  sudo                     # auto 'sudo' your last command (double-ESC <- bind)
  vi-mode                  # enhanced vim-mode
  zsh-autosuggestions      # autosuggestions, obv
  zsh-syntax-highlighting  # highlight as you type
  z                        # list frequent and recent folders
)

eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

alias sourceme='source ~/.zshrc'

[ -f "$HOME/.config/shell/.aliases" ] && source   "$HOME/.config/shell/.aliases"
[ -f "$HOME/.config/shell/.funcs" ] && source     "$HOME/.config/shell/.funcs"
[ -f "$HOME/.config/shell/.env" ] && source     "$HOME/.config/shell/.env"
[ -f "$HOME/.config/shell/.sources" ] && source   "$HOME/.config/shell/.sources"
[ -f "$HOME/.config/shell/.variables" ] && source "$HOME/.config/shell/.variables"
# [ -f "$HOME/.config/zsh/.zsh_aliases" ] && source "$HOME/.config/zsh/.zsh_aliases"
[ -f "$HOME/.config/zsh/.zsh_binds" ] && source   "$HOME/.config/zsh/.zsh_binds"
# [ -f "$HOME/.config/zsh/.zsh_options" ] && source "$HOME/.config/zsh/.zsh_options"

cd $HOME # start here on new shell
