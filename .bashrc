#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
eval $(dircolors ~/.dircolors)

# Сброс
ColorOff='\e[0m'

# Высоко Интенсивные
IBlack='\e[0;90m'
IRed='\e[0;91m'
IGreen='\e[0;92m'
IYellow='\e[0;93m'
IBlue='\e[0;94m'
IPurple='\e[0;95m'
ICyan='\e[0;96m'
IWhite='\e[0;97m'

case "$TERM" in
    xterm-color|*-256color|xterm-termite) color_prompt=yes;;
esac

hg_branch() {
	hg prompt "{:[on {branch}]}" 2> /dev/null
}

ssh_agent_startup() {
    if [ -z "$SSH_AUTH_SOCK" ]; then
        if [ ! -z $(which ssh-agent) ]; then
            eval `ssh-agent -s` > /dev/null 2>&1

            for rsa_key in $(ls $HOME/.ssh | grep "^id_" | grep -v "pub$")
            do
                ssh-add $HOME/.ssh/$rsa_key > /dev/null 2>&1
            done
        fi
    fi
}

# main

if [ "$color_prompt" = yes ]; then
    # do not use color variables, because of single quotes for hg_branch()
    PS1='\[\e[0;92m\]\u@\h:\[\e[0;94m\][\w]\[\e[0;93m\]$(hg_branch)\n\[\e[0m\]$ '
else
    PS1='[\u@\h \W]\$ '
fi

ssh_agent_startup
