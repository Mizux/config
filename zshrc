# Prompt
autoload -U colors && colors

local c_red="%{$fg[red]%}"
local c_green="%{$fg[green]%}"
local c_blue="%{$fg[blue]%}"
local c_yellow="%{$fg[yellow]%}"
local c_reset="%{$reset_color%}"

local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"

local path_p="${blue_op}${c_yellow}%~${c_reset}${blue_cp}"
local user_host="${c_red}%n${c_reset}@${c_yellow}%m${c_reset}"
local ret_status="${blue_op}%(?,${c_green}%?${c_reset},${c_red}%?${c_reset})${blue_cp}"
local hist_no="${blue_op}%h${blue_cp}"
local smiley="%(?,${c_green}^v^${c_reset},${c_red}>_<${c_reset})"
PROMPT="${ret_status}─${path_p}
${blue_op}${smiley}${blue_cp}─${user_host} %#"
local cur_cmd="${blue_op}%_${blue_cp}"
PROMPT2="${cur_cmd}> "

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
zstyle :compinstall filename '~/.zshrc'
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
