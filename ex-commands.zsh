# {{{ Handle fpath/$0
# ref: zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
[[ $PMSPEC = *f* ]] || fpath+=("${0:h}/functions")
autoload -Uz read-from-minibuffer ex-command _zvm_ex_command
# }}}
zstyle ':completion:zvm-cmd:*' completer _zvm_ex_command
zle -N ex-command
bindkey -M vicmd : ex-command

# vim:foldmethod=marker
