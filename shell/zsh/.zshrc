eval "$(starship init zsh)"
alias l='lsd -lha'
alias cat='bat --style plain --paging=never'
alias lesson-prompt='xdg-open ~/from-mint/chatgpt/LessonCreator.txt'
alias vim='nvim'
export EDITOR=nvim
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland,x11

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias f='fd | fzf'
alias fp="fd | fzf --preview '([[ -d {} ]] && ls -lha {}) || bat --style=numbers --color=always {} | head -100'"
alias zd='zoxide query -1 | fzf | xargs -r cd'

