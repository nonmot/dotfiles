: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_STATE_HOME:=$HOME/.local/state}

export HISTFILE="${XDG_STATE_HOME}/zsh/history"
mkdir -p "${HISTFILE:h}"
SAVEHIST=100000
HISTSIZE=100000

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# poetry
export PATH="$HOME/.local/bin:$PATH"


# mise
eval "$(mise env)"

