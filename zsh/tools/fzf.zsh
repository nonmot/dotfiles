
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="
--multi --border=rounded --height 85% --layout=reverse
--marker ▏ --pointer ▌ --prompt ▌
--info=inline --header=\"fzf version: $(fzf --version)\" --header-first
--preview \"bat --style=numbers --color=always {}\"
--preview-window=down,50%,wrap
--color=border:#b4befe,fg:#a9b1d6,fg+:#a6e3a1,hl:#f5c2e7,hl+:#89b4fa,bg+:#11111b,pointer:#f38ba8,prompt:#89dceb,info:#b4befe,header:#a6e3a1,scrollbar:#eba0ac,preview-scrollbar:#eba0ac,preview-border:#89dceb
"

