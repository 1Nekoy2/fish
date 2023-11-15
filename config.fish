if status is-interactive
    set fish_greeting                                 # Supresses fish's intro message
         if status is-interactive
         and not set -q TMUX
              exec tmux
         end
         #    exec neofetch
    #theme
    #fish_config theme save "Catppuccin Mocha"
    alias la="lsd -hA --group-dirs first"
    alias l="lsd"
    alias ll="lsd -hlA --group-dirs first"
    alias nv="nvim"
    alias cr="clear"
    alias lg="lazygit"
end
