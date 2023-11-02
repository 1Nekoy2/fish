if status is-interactive
    set fish_greeting                                 # Supresses fish's intro message
    set nv "nvim"
     if status is-interactive
     and not set -q TMUX
          exec tmux
     end
    #theme
    #fish_config theme save "Catppuccin Mocha"
end
