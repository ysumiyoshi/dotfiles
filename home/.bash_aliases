if type "nvim" > /dev/null 2>&1; then
	alias vi='nvim'
fi

if [ -x "$(brew --prefix yarn)/bin/yarn" ]; then
  alias yarn="$(brew --prefix yarn)/bin/yarn"
fi

alias ..='cd ..'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -lh'
alias la='ls -lA'
alias k='kubectl'
complete -o default -F __start_kubectl k
