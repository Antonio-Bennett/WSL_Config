# config.fish start ssh agent
if not pgrep -f ssh-agent > /dev/null
eval (ssh-agent -c)
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -Ux SSH_AGENT_PID $SSH_AGENT_PID
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

# Add key to ssh agent
#ssh-add ~/.ssh/id_ed25519

#This is the theme
starship init fish | source 

#set fish shell to vim binding
fish_vi_key_bindings

#Working with files and URLS: Chrome - Urls and open - Files
alias chrome='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
alias open='wslview'

#Lazygit alias 
alias lg='lazygit'

#These are vim/neovim aliases

alias vim='nvim' #makes vim command open neovim - vim can be opened using vi or /vim
alias svim='sudoedit' #opens sudo priveleges to edit -- changed EDITOR for sudoedit to neovim

#These are exa/ls aliases

# general use
alias ls='exa'                                                         # ls
alias l='exa -lbF --git'                                               # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                      # one column, just names
alias lt='exa --tree --level=2'                                        # tree
