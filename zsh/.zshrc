# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Cargo/Rust (move .cargo and .rustup)
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# NPM (move .npm)
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Less history (move .lesshst)
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Wget (move .wget-hsts)
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
# Then create ~/.config/wget/wgetrc with: hsts-file = ~/.cache/wget-hsts

# Zsh (move .zcompdump files)
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$HOST"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias y='yazi'
alias lg='lazygit'
alias cat='bat'

# Enable VI mode
bindkey -v

# Reset
export COLOR_RESET=$'\x1b[0m'

# Main palette
export COLOR_BLACK=$'\x1b[38;2;15;15;15m'          # #0f0f0f
export COLOR_GRAY0=$'\x1b[38;2;19;20;20m'          # #131414
export COLOR_GRAY1=$'\x1b[38;2;29;31;30m'          # #1D1F1E
export COLOR_GRAY2=$'\x1b[38;2;39;42;40m'          # #272A28
export COLOR_GRAY3=$'\x1b[38;2;58;63;60m'          # #3A3F3C
export COLOR_GRAY4=$'\x1b[38;2;88;95;90m'          # #585F5A
export COLOR_GRAY5=$'\x1b[38;2;107;116;110m'       # #6B746E
export COLOR_GRAY6=$'\x1b[38;2;135;142;122m'       # #878E7A
export COLOR_GRAY7=$'\x1b[38;2;153;156;139m'       # #999C8B
export COLOR_GRAY8=$'\x1b[38;2;182;182;154m'       # #B6B69A
export COLOR_GRAY9=$'\x1b[38;2;216;204;180m'       # #D8CCB4
export COLOR_GRAY10=$'\x1b[38;2;227;218;201m'      # #E3DAC9
export COLOR_WHITE=$'\x1b[38;2;249;238;229m'       # #F9EEE5

# Accent colors
export COLOR_LIGHT_YELLOW=$'\x1b[38;2;239;190;113m' # #efbe71
export COLOR_YELLOW=$'\x1b[38;2;239;148;77m'        # #ef944d

# You can use these colors in your scripts...
# echo "${COLOR_BLUE}Some message${COLOR_RESET}"

#---- Custom prompt ----
theme_reset_prompt(){
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      LL_BRANCH_NAME='(detached)'
     else 
      LL_BRANCH_NAME="[$branch]"
    fi
  else 
    LL_BRANCH_NAME=''
  fi

  git_status_result=$(git status --porcelain 2> /dev/null)
  if [[ "$git_status_result" != "" ]]; then
     # branch is dirty
     LL_BRANCH_COLOR=$COLOR_LIGHT_YELLOW
  else
     # branch is clean
     LL_BRANCH_COLOR=$COLOR_GRAY6
  fi

  LL_PWD=${PWD/$HOME/}
  if [[ $LL_PWD = "" ]];then
      LL_PWD="~"
  fi

  LL_PROMPT=$'\n'"› "
  return 0
}

setopt prompt_subst
autoload -U add-zsh-hook 
add-zsh-hook precmd theme_reset_prompt
PROMPT='%{$LL_BRANCH_COLOR%}${LL_BRANCH_NAME} %{$COLOR_GRAY5%}${LL_PWD}%{$COLOR_RESET%}${LL_PROMPT}'

## Uncomment this to use VI mode
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/N}/(main|viins)/ I}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# Add ~/.dotnet and ~/.dotnet/tools to path. For installations with bash from official dotnet docs
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

eval "$(zoxide init zsh)"
