# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Environment
# =============================================================================

export EDITOR="nvim"
export VISUAL="nvim"

# =============================================================================
# Oh My Zsh
# =============================================================================

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# =============================================================================
# CLI Utilities
# =============================================================================

# Smart directory navigation
eval "$(zoxide init zsh)"

# =============================================================================
# Aliases
# =============================================================================

# Editor
alias vim='nvim'

# Directory listings
alias ll='eza -lah --icons --git'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'

# Navigation
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Safer file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# =============================================================================
# Powerlevel10k
# =============================================================================

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Automatically attach to the main tmux session when opening
# an interactive terminal outside of tmux.
if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ] && [[ $- == *i* ]] && tty -s; then
    tmux new-session -A -s main
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
