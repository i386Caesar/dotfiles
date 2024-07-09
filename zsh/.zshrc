if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# EXPORTS
export PATH="/usr/local/bin:$PATH"
export CONDA_CHANGEPS1=false
export EDITOR=/opt/homebrew/bin/nvim
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH="$HOME/go"
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
export PATH="$PATH:$GOPATH/bin"
export PATH=$HOME/go/pkg:$PATH
export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# SOURCES
source "${ZINIT_HOME}/zinit.zsh"
source "$HOME/.cargo/env"
source <(fzf --zsh)

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# SNIPPETS
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
#bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#OPEN NVIM
function open_nvim() {
  nvim
}
zle -N open_nvim
bindkey '^o' open_nvim

#Open Nvim With fzf
function fzf_nvim() {
    fd --type f --hidden --exclude .git | fzf | xargs nvim
}
zle -N fzf_nvim
bindkey '^f' fzf_nvim


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'ls --color $realpath'

# EVALS
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# eval $(thefuck --alias)

# ALIASES
alias vim="nvim"
alias dot="z dotfiles"
alias c="clear"
alias rm="rip"
alias :q="exit"
alias zshrc="nvim ~/.zshrc"
alias code="code-insiders"
alias u="source ~/.zshrc"
alias a="tmux attach"
alias ls="eza"
alias l="eza -l --icons --git -a"
alias ll="eza --tree --level=2 --long --icons --git"
alias e="eza --long --tree"
alias preview="open -a Preview"
alias burpsuite="open -a Burp\ Suite\ Community\ Edition ."
alias pg="echo 'Pinging Google' && ping www.google.com";
alias dow="cd ~/Downloads/"
alias doc="cd ~/Documents/"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias sshdir="cd ~/.ssh"
alias runp="lsof -i "
alias md="mkdir "


# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# FUNCTIONS
alias rr="ranger"
function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}


# SEC STUFF
alias gobust='gobuster dir --wordlist ~/security/wordlists/diccnoext.txt --wildcard --url'
alias dirsearch='python dirsearch.py -w db/dicc.txt -b -u'
alias massdns='~/hacking/tools/massdns/bin/massdns -r ~/hacking/tools/massdns/lists/resolvers.txt -t A -o S bf-targets.txt -w livehosts.txt -s 4000'
alias server='python -m http.server 4445'
alias tunnel='ngrok http 4445'
alias fuzz='ffuf -w ~/hacking/SecLists/content_discovery_all.txt -mc all -u'
alias gr='~/go/src/github.com/tomnomnom/gf/gf'
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# source activate Mako

# pnpm
export PNPM_HOME="/Users/viper/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
