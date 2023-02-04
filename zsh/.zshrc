# ~/.config/zsh/.zshrc

# -------
# Aliases

source $ZDOTDIR/aliases

# --------
# Bindings

bindkey -e
bindkey -s '^o' '. ranger\n'

# ------
# Prompt

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%F{green}%2(/.%2~.%2/)%f %F{yellow}$(git_branch_name)%f > '

# ---------------
# Directory stack

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# -------------
# Auto-complete

fpath+=~/.config/zsh/zfunc
autoload -U compinit && compinit
_comp_options+=(globdots)   # With hidden files
source $ZDOTDIR/completion.zsh

# --------------
# thefuck config
eval $(thefuck --alias)

# ---------------
# History options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt nosharehistory

# ----------------------------
# Set up nvm for node versions
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ----------------------------
# path for pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# ----------------------------
# pnpm
export PNPM_HOME="/Users/Ben.Berry-Allwood/.config/local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"


# -------------------
# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
