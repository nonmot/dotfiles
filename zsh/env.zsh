: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_STATE_HOME:=$HOME/.local/state}

export HISTFILE="${XDG_STATE_HOME}/zsh/history"
mkdir -p "${HISTFILE:h}"
SAVEHIST=100000
HISTSIZE=100000

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# mise
eval "$(mise env)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# NVM (Node Version Manager)
# --- nvm lazy load + cd hook ---
export NVM_DIR="$HOME/.nvm"

# nvmコマンドが呼ばれたら初めて読み込む
_nvm_lazy_load() {
  unset -f nvm node npm npx pnpm yarn 2>/dev/null
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

nvm()  { _nvm_lazy_load; nvm  "$@"; }
node() { _nvm_lazy_load; node "$@"; }
npm()  { _nvm_lazy_load; npm  "$@"; }
npx()  { _nvm_lazy_load; npx  "$@"; }

# cdしたときだけ .nvmrc を見て切り替え（hookは軽量に）
autoload -Uz add-zsh-hook
_nvm_auto_use() {
  # nvm未ロードならロード（ここで初回のみ）
  [[ -z "${NVM_LOADED:-}" ]] && { NVM_LOADED=1; _nvm_lazy_load; }

  local nvmrc
  nvmrc="$(nvm_find_nvmrc 2>/dev/null)" || return 0
  [[ -z "$nvmrc" ]] && return 0

  local ver
  ver="$(<"$nvmrc")"
  [[ -z "$ver" ]] && return 0

  # 既にそのバージョンなら何もしない
  [[ "$(nvm current 2>/dev/null)" == "$ver" ]] && return 0

  nvm use --silent "$ver" >/dev/null
}
add-zsh-hook chpwd _nvm_auto_use

