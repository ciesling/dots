autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
zstyle :compinstall filename '/home/coltom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.config/zsh/aliases
source ~/.local/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias als='sh ~/.config/zsh/scripts/alias.sh'

alias cd="z"

eval "$(zoxide init zsh)"
source <(fzf --zsh)

