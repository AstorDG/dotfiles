# 5.9

#command prompt
eval "$(starship init zsh)"

#plugins
source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#path variables
path=(
	$path
	~/.zig/
	)

#command history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
