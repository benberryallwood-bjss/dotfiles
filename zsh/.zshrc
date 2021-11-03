# ~/.config/zsh/.zshrc

# -------
# Aliases

source $ZDOTDIR/aliases

# --------
# Bindings

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

# -------
# Vi mode

bindkey -v
export KEYTIMEOUT=1

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# -------------
# Auto-complete

autoload -U compinit && compinit
_comp_options+=(globdots)   # With hidden files
source $ZDOTDIR/completion.zsh

# --------------
# thefuck config
eval $(thefuck --alias)

# -------------------
# Syntax highlighting

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
