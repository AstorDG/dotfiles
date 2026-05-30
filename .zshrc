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
	)

alias python='/opt/homebrew/bin/python3'
alias pip='/opt/homebrew/bin/pip3'

#command history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=4000
SAVEHIST=4000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

alias ls="lsd"
alias ll="lsd -la"
alias n="nvim"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/astor/.lmstudio/bin"
# End of LM Studio CLI section


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
