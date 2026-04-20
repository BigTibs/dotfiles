# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

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

# ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

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
alias bat='batcat'
alias v='nvim .'

# Enable VI mode
bindkey -v

## Copy this into your .zshrc file
export COLOR_RESET=$'\x1b[0m'
export COLOR_LACK=$'\x1b[38;2;112;128;144m'
export COLOR_LUSTER=$'\x1b[38;2;222;238;237m'
export COLOR_ORANGE=$'\x1b[38;2;255;170;136m'
export COLOR_GREEN=$'\x1b[38;2;120;153;120m'
export COLOR_BLUE=$'\x1b[38;2;119;136;170m'
export COLOR_RED=$'\x1b[38;2;215;0;0m'
export COLOR_BLACK=$'\x1b[38;2;0;0;0m'
export COLOR_GRAY1=$'\x1b[38;2;8;8;8m'
export COLOR_GRAY2=$'\x1b[38;2;25;25;25m'
export COLOR_GRAY3=$'\x1b[38;2;42;42;42m'
export COLOR_GRAY4=$'\x1b[38;2;68;68;68m'
export COLOR_GRAY5=$'\x1b[38;2;85;85;85m'
export COLOR_GRAY6=$'\x1b[38;2;122;122;122m'
export COLOR_GRAY7=$'\x1b[38;2;170;170;170m'
export COLOR_GRAY8=$'\x1b[38;2;204;204;204m'
export COLOR_GRAY9=$'\x1b[38;2;221;221;221m'

# You can use these colors in your scripts...
# echo "${COLOR_BLUE}Some message${COLOR_RESET}"

#---- PROMPT ---- ##############################################
lackluster_reset_prompt(){
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
     LL_BRANCH_COLOR=$COLOR_ORANGE
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
add-zsh-hook precmd lackluster_reset_prompt
PROMPT='%{$LL_BRANCH_COLOR%}${LL_BRANCH_NAME} %{$COLOR_GRAY5%}${LL_PWD}%{$COLOR_RESET%}${LL_PROMPT}'

## UNCOMMENT THIS IF YOU USE VI MODE
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/N}/(main|viins)/ I}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Add ~/.dotnet and ~/.dotnet/tools to path. For installations with bash from official dotnet docs
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
