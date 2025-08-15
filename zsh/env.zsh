: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_STATE_HOME:=$HOME/.local/state}

export HISTFILE="${XDG_STATE_HOME}/zsh/history"
mkdir -p "${HISTFILE:h}"
SAVEHIST=100000
HISTSIZE=100000

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
export PATH="/Users/aa549998/.local/bin:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/aa549998/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Setting for act
export DOCKER_HOST=unix:///Users/aa549998/.rd/docker.sock

