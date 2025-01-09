# ~/.config/zsh/.zshrc

# -----------------------
# Avoid "last login" line

printf '\33c\e[3J'

# -------
# Aliases

source $ZDOTDIR/aliases

# --------
# Bindings

bindkey -e
bindkey -s '^o' '. ranger\n'

# ---------------
# Directory stack

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# -----------------
# Cursor appearance

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

fpath+=~/.config/zsh/zfunc
autoload -Uz compinit && compinit
_comp_options+=(globdots)   # With hidden files
source $ZDOTDIR/completion.zsh

zstyle ':completion:*' menu select

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
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -------------------
# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------
# starship
eval "$(starship init zsh)"

# ----------------------------
# mise
# eval "$(mise activate zsh)"
