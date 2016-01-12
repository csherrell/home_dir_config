# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
######
#BLOCKS
#HMI_DAILY_DATA
#HMI_RESULTS_DATA
#HMI_COMPILED_DATA

#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

export WAAS_DEFAULT_DATA_DIR=/wmd/daily
export WAAS_DEFAULT_SYSTEM=field

export PROJECT_DIR=/home/csherrell/build
#export PROJECT_DIR=/wmd/software/$PROJECT_CYCLE

export PROJECT_ENV=dev
#export PROJECT_DIR=/wmd/software
export PYTHONPATH=/home/csherrell/Dropbox/testcode/python/rinex2:/home/csherrell/bin:/anomaly/tools/bin:/anomaly/tools/lib/python:/home/csherrell/python/lib:$PROJECT_DIR/$PROJECT_ENV/lib/python/:/wmd/software/prod/tools/lib

export WAAS_MONITORING_DATA=/wmd
export WAAS_SYSTEM_TYPE=field

export PATH=$PATH:.:/wmd/software/prod/tools/bin
#export PATH=/opt/java/64/jre1.7.0_09/bin:/usr/local/MATLAB/R2010b/bin:$PATH
export PATH=/home/csherrell/Downloads/jre1.6.0_37/bin:/usr/local/MATLAB/R2010b/bin:$PATH
#export ORACLE_HOME=/var/opt/oracle/11.2/client64
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
export PATH=$PATH:$ORACLE_HOME/bin
export PATH=$PATH:$PROJECT_DIR/$PROJECT_ENV/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export CLASSPATH=$CLASSPATH:/home/csherrell/Downloads/rabbitmq-java-client-bin-3.1.5

################################################################################

#######
####### NOTHING AFTER THIS IS RAN IN CRON
####### CRON IS NOT AN INTERACTIVE SHELL
#######

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
#export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

####   if [ "$color_prompt" = yes ]; then
####       PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
####   else
####       PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
####   fi
####   unset color_prompt force_color_prompt
####   

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# User specific aliases and functions
alias xterm='xterm -sb -sl 10000 -fa mnaco -fs 14 -fg yellow -bg midnightblue -ls'
alias gt='gnome-terminal'
alias mkdir='mkdir -p'
alias ff='find . -iname \"*$1*\"'
alias rminode='find . -maxdepth 1 -inum \!^ -exec /bin/rm -i \"{}\" \;'
#alias rminode='find . inum $1 -maxdepth 1 -exec rm -i {} \;'
alias recent='find . -type f -printf "%T@ %p\n" | sort -k 1nr | sed "s/^[^ ]* //" | head -n 50'
alias hg='history | grep '
alias h='history'
alias hrank='cut -f1 -d" " .bash_history | sort | uniq -c | sort -n'
alias less='less -S -X'
alias more='less -S -X'
alias ssh='ssh -AY'
#alias hg='history | grep $@'
#alias psg='ps -aef | grep $@'

alias oei-collector='ssh -Y csherrell@162.58.43.31'
alias anomaly='ssh -Y csherrell@anomaly.waas.lab'
alias modok='ssh -Y csherrell@modok.waas.lab'
alias hal='ssh -Y csherrell@hal9000.waas.lab'
alias sftpanomaly='sftp csherrell@162.58.43.64'
alias waas-ajw='ssh -Y sherrell@waas-ajw'

alias cdoc='man 3'
alias workoff='deactivate'

alias rdato='xfreerdp -x l -g 3840x1175 -u "Chad Sherrell" JAMCSWL00030692'

ulimit -c unlimited

export LS_COLORS='di=35;1'

alias ls='ls --color -F'

#alias auth='grep -v CRON /var/log/auth.log'
#alias auth='grep -hv "CRON\|Cannot find command to construct key" /var/log/auth.log.3 /var/log/auth.log.2 /var/log/auth.log.1 /var/log/auth.log'
alias auth='grep -h "unlocked" /var/log/auth.log.3 /var/log/auth.log.2 /var/log/auth.log.1 /var/log/auth.log | cut -c1-15'

export ousvn=svn+ssh://sherrell@nri.ou.edu/svn/
export slocal=file:///home/svn/
export rep=svn+ssh://csherrell@rep/anomaly/apps/subversion/AJW1921
export myrep=file:///rep/apps/subversion/users/csherrell
export svnusers=svn+ssh://csherrell@rep/anomaly/apps/subversion/users
export SVN_EDITOR=vim
export EDITOR=vim

#unset HISTFILESIZE
#unset HISTSIZE
HISTFILESIZE=1000000000
HISTSIZE=1000000
shopt -s histappend

# mkdir & cd into it
function mkcd() {
  mkdir -p "$*" && cd "$*" && pwd
}

# Compress the cd, ls -l series of commands.
alias lc="cl"
function cl () {
   if [ $# = 0 ]; then
      cd && ls               # or cd & ll
   else
      cd "$*" && ls
   fi
}

function f
{
    find . -iname "*$@*" 2>/dev/null
}

export LS_COLORS='di=35;1'

#export PYTHONPATH=/home/sherrell/Django/django_projects/myproject
#export PYTHONPATH=$PYTHONPATH:/home/sherrell/Django/django_projects
#export PYTHONPATH=$PYTHONPATH:/home/sherrell/testcode/python/rinex
#export PYTHONPATH=/home/csherrell/testcode/python/rinex2:/usr/lib/scons

#HISTCONTROL=erasedups
#HISTSIZE=10000
#HISTCONTROL=ignoreboth:erasedups
HISTCONTROL=ignoreboth

export HOSTFILE=/etc/hosts

#for i in `/bin/ls */*09o`; do grep "^ 09" $i | wc; done

alias rdo='sudo `fc -ln 0 | sed 's/^[[:space:]]*//'`'

# Backup my bash_history file just to be safe
#~/bin/backup ./.bash_history
sort -u ~/.bash_history > ~/.backup/bash_history.`date +"%Y%m%d%H%M%S%N"`

# Make sure firefox does open up a remote verion on the remote machine
export MOZ_NO_REMOTE=1

#export PYTHONPATH=/anomaly/tools/lib/python:/usr/lib/scons:/home/csherrell/testcode/python/rinex2


echo `date +"%Y-%m-%d %H:%M:%S"` Login >> ~/.session
alias sn='echo `date +"%Y-%m-%d %H:%M:%S"` $@ >> ~/.session'
alias h2t='html2text'
alias kp='keepassx ~/Dropbox/KeePass/Database.kdb'
alias vagrant=vagrant_funtion

vagrant_funtion() {
    if [[ $@ == reboot* ]]; then
        hosts=${@#"reboot"}
        command /usr/bin/vagrant halt "${hosts}" && /usr/bin/vagrant up "${hosts}"
    else
        command vagrant "$@"
    fi
}
