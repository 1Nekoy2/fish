
# #######################################################################################
#
#
#  ███████╗██╗███████╗██╗  ██╗
#  ██╔════╝██║██╔════╝██║  ██║
#  █████╗  ██║███████╗███████║
#  ██╔══╝  ██║╚════██║██╔══██║
#  ██║     ██║███████║██║  ██║
#  ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
#
# By Nekoy
# #######################################################################################

## Exports 
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "nvim"                                 # $EDITOR use nvim in terminal
set -U zoxide_cmd "cd"
set -U FZF_COMPLETE 2

## Path Variables
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_STATE_HOME "$HOME/.local/state"
set -Ux XDG_CACHE_HOME "$HOME/.cache"

## Universal exports
set -Ux CALCHISTFILE "$XDG_CACHE_HOME/calc_history"
set -Ux CARGO_HOME "$XDG_DATA_HOME/cargo"
set -Ux CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -Ux GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -Ux GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -Ux RUSTUP_HOME "$XDG_DATA_HOME/rustup"

## fuzzy finder themeing 
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# source 
source "/home/nekoy/.local/share/cargo/env.fish"

## Manpager
set -x MANPAGER "nvim +Man!"

## On start up
if status is-interactive

   run-on-start-up

end

if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

# keybindings
function fish_user_key_bindings

    #fish_default_key_bindings
    fish_vi_key_bindings

end

# start up function

## aliases

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# nvim
alias nv="nvim"
alias nvi="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

# package menagers 
alias paru="systemd-inhibit --what=idle paru"
alias eos-update="systemd-inhibit --what=idle eos-update"

# tmux
alias t="tmux"
alias tm="tmux new-session -A -s main"

# ls to lsd
alias l="lsd"
alias la="lsd -hA --group-dirs first"
alias ll="lsd -hlA --group-dirs first"
alias l.='lsd -A | grep -E "^."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# Play audio files in current dir by type
alias playwav='vlc *.wav'
alias playogg='vlc *.ogg'
alias playmp3='vlc *.mp3'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# Rebos
alias rebl='rebos gen list'
alias rebc='rebos gen commit'
alias rebb='systemd-inhibit --what=idle rebos gen current build'
alias rebsync="systemd-inhibit --what=idle rebos managers sync"
alias rebupgrade="systemd-inhibit --what=idle rebos managers upgrade"

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /usr//bin/fish && echo 'Now log out.'"

# shortend commands
alias icat="kitten icat"
alias cr="clear"
alias lg="lazygit"
alias btop="bpytop"
alias nf="fastfetch"

# fun
alias catsay="fortune | cowsay -f kitty | lolcat"
alias flair="~/.config/dotfiles-scripts/flair/flair.sh"
alias cflair="~/.config/dotfiles-scripts/flair/flair.sh * | wl-copy"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# n/a
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

## initialize Starship 

fzf --fish | source
starship init fish | source
