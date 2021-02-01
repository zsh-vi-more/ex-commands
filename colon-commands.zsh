# {{{ Handle fpath/$0
# ref: zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
[[ $PMSPEC = *f* ]] || fpath+=("${0:h}/functions")
autoload -Uz vi-colon-command _zvm_colon_cmd
# }}}

bindkey -M vicmd : vi-colon-command

# vim:foldmethod=marker
