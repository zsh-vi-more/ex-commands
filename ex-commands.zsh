# {{{ Handle fpath/$0
# ref: zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
[[ $PMSPEC = *f* ]] || fpath+=("${0:h}/functions")
autoload -Uz read-from-minibuffer regexp-replace ex-command{,-help} _zvm_ex_command
# }}}
zstyle ':completion:zvm-cmd:*' completer _zvm_ex_command
autoload -Uz zed zed-set-file-name
zle -N ex-command
bindkey -M vicmd : ex-command
zed-set-file-name-arg(){
	emulate -L zsh
	zed_file_name=$1
}

zle -N edit   zed
zle -N e      zed
zle -N saveas zed-set-file-name-arg
zle -N sav    zed-set-file-name-arg
# vim:foldmethod=marker
