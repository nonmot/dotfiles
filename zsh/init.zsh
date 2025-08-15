for file in env; do
  source "$ZDOTDIR/${file}.zsh"
done

# 非対話モード
if [[ ! -o interactive ]]; then
  [[ -r "$ZDOTDIR/env.zsh" ]] && source "$ZDOTDIR/env.zsh" 
  return
fi

if [[ -r "$ZDOTDIR/env.zsh" ]];then
  echo "$ZDOTDIR/env.zsh is loaded" 
  source "$ZDOTDIR/env.zsh" 
fi

if [[ -r "$ZDOTDIR/omz.zsh" ]]; then
  echo "$ZDOTDIR/omz.zsh is loaded" 
  source "$ZDOTDIR/omz.zsh"
fi

if [[ -r "$ZDOTDIR/aliases.zsh" ]]; then
  echo "$ZDOTDIR/aliases.zsh is loaded" 
  source "$ZDOTDIR/aliases.zsh"
fi

if [[ -r "$ZDOTDIR/tools/fzf.zsh" ]]; then
  echo "$ZDOTDIR/tools/fzf.zsh is loaded" 
  source "$ZDOTDIR/tools/fzf.zsh"
fi

if [[ -r "$ZDOTDIR/tools/yazi.zsh" ]]; then
  echo "$ZDOTDIR/tools/yazi.zsh is loaded" 
  source "$ZDOTDIR/tools/yazi.zsh"
fi

if [[ -r "$ZDOTDIR/tools/iterm2.zsh" ]]; then
  echo "$ZDOTDIR/tools/iterm2.zsh is loaded" 
  source "$ZDOTDIR/tools/iterm2.zsh"
fi

fpath=("$ZDOTDIR/functions" $fpath)
autoload -Uz $ZDOTDIR/functions/*(:t)
