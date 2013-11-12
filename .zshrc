# Prompt
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}%#"
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
bindkey -e
export TERM=xterm-256color

# PATH
export PATH=~/.local/bin:$PATH
# Alias
alias ls='ls --group-directories-first --color'
alias ll='ls -lh'
alias la='ls -lha'

# History stuff
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Arrow History Management
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

# Completion
zstyle :compinstall filename '/home/clemolgat/.zshrc'
autoload -Uz compinit && compinit

# Aldebaran STUFF
export PATH=~/Qt/Tools/QtCreator/bin:$PATH
export PATH=~/eclipse/android-sdks/platform-tools:$PATH

export PYTHONPATH=~/pynaoqi-python2.7-1.24.0.109-linux64:$PYTHONPATH

alias qo='qibuild open'
alias qc='qibuild configure'
alias qm='qibuild make'
alias qd='qibuild deploy'
alias qi='qibuild install'

function qicd {
  p=$(python -m 'qicd' $1)
  if [[ $? -ne 0 ]]; then
    return
  fi
  cd ${p}
}
