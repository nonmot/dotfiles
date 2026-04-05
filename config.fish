if test -f /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Applications/Obsidian.app/Contents/MacOS

# 環境固有の設定を読み込む
if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end

mise activate fish | source
starship init fish | source

set -gx EDITOR nvim
set -gx VISUAL nvim

abbr vim "nvim"
abbr lg "lazygit"
