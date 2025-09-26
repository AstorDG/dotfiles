# 5.9

#command prompt
eval "$(starship init zsh)"

#plugins
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#path variables
path=(
	$path
	~/.zig/
	)
alias python='/opt/homebrew/bin/python3'

#command history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=4000
SAVEHIST=4000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/winston/.lmstudio/bin"
# End of LM Studio CLI section

