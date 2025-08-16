{ config, pkgs, ... }:

{
  home.username = "haiminh256";
  home.homeDirectory = "/home/haiminh256";
  home.stateVersion = "25.11";

  programs.zsh = {
    enable = true;
    initContent = ''
# ~/.zshrc — Kali-style inspired Zsh config

# Prompt: [user@host current_dir]$
autoload -Uz colors && colors
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m %F{blue}%~%f $ '

# Colored LS
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias nrs='sudo nixos-rebuild switch --impure --flake ~/.nix'
alias ncl='sudo nix-collect-garbage -d'

# Use bat instead of cat (syntax highlighting)

# Git shortcuts
alias gst='git status'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias ga='git add .'
alias gc='git commit -m'

# Safe remove
alias rm='rm -i'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Extract function
extract () {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Enable 'thefuck' (if installed)

# FZF file search shortcut
alias ff='fzf --preview "bat --style=numbers --color=always {}"'

# Enable colors for grep
    '';
  };

  home.packages = with pkgs; [
    
  ];
}
