if status is-interactive
    # Supresses fish's intro message
    set fish_greeting

    # automaticaly start tmux
#   if status is-interactive
#   and not set -q TMUX
#       exec tmux
#   end
#   #theme
#   fish_config theme save "Catppuccin Mocha"

    # aliases
    alias la="lsd -hA --group-dirs first"
    alias l="lsd"
    alias ll="lsd -hlA --group-dirs first"
    alias nv="nvim"
    alias cr="clear"
    alias lg="lazygit"
    alias btop="bpytop"
    
    #zoxide integration
    zoxide init --cmd cd fish | source
end
