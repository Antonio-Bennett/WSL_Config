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

#Use latest node
#nvm use latest 

#Update, upgrade, install, remove and delete
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt install'
alias remove='sudo apt autoremove'
alias delete_package='sudo ppa-purge'
alias delete_program='sudo apt-get --purge remove'

#Working with program install paths and dependencies
alias list_files_of='dpkg -L'
alias find_package='dpkg -l | grep'
alias dependencies_of='apt-cache rdepends'

#Fish working with paths
alias list_path='echo $fish_user_paths | tr " " "\n" | nl'

#Working with multiple versions of program [commonly python]
alias list_alternatives='sudo update-alternatives --config'
alias add_alternative='sudo update-alternatives --install'
alias query_alternative='sudo update-alternatives --query'
alias remove_alternative='sudo update-alternatives --remove'

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
