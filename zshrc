# System-wide profile for interactive zsh(1) shells.

# Setup user specific overrides for this in ~/.zshrc. See zshbuiltins(1)
# and zshoptions(1) for more details.

#for yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete# Correctly display UTF-8 with combining characters.

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Default prompt
PS1="%F{%(?.green.red)}%(?.✔︎.✘)%f [%*] %F{green}%n%f@%F{cyan}%m%f %2~ %# "

export XDG_DATA_HOME="$HOME/.local/share/"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
alias vi='vim'
alias emacs="emacs -nw --no-splash"
export EDITOR='vim'
if command -v kitten >/dev/null 2>&1; then
  alias ssh='kitten ssh'
  alias diff='kitten diff'
fi

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# cabal package install
# ghcup install
PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

#agda latex env
export Agda_datadir="$(agda --print-agda-data-dir)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#ruby env
export GEM_HOME="$(gem env user_gemhome)"
PATH="$GEM_HOME/bin:$PATH"

#ROCm
PATH="/opt/rocm/bin:$PATH"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
