#####################################################################################
##   Your Bash profile will work with out the need to edit either of your files:   ##
##                                                                                 ##
##              .bash_profile     or     .bashrc                                   ##
##                                                                                 ##
##   However if you would like to add to your environment settings, feel free      ##
##   to add your settings to this file.                                            ##
##                                                                                 ##
##   If you wish to completely disable all Sanger specfic Environment Variables    ##
##   then you can create the following empty text file at the top level of your    ##
##   unix home directory:                                                          ##
##                                                                                 ##
##                       .no_bashrc                                                ##
##                                                                                 ##
##   WARNING: Once created you will nolonger source any sanger environmental       ##
##            settings.                                                            ##
##                                                                                 ##
##   If you wish to discuss your setup requirements or just need advice then       ##
##   please contact helpdesk and we can help get you set up.                       ## 
##                                                                                 ##
##         Email: helpdesk@sanger.ac.uk  or  Phone: 7999 (01223 495300)            ##
##                                                                                 ##
#####################################################################################

export PATH="$PATH:/software/CGP/bin" # add CASM programs to PATH
export PATH=/nfs/users/nfs_p/pb18/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin:$PATH # add Ruby to path (Homebrew needs Ruby to run)
export PATH="/nfs/users/nfs_p/pb18/.linuxbrew/Homebrew/bin/:$PATH" # add programs installed by homebrew 
export DATABASECONNCONFIG=/software/CGP/projects/databaseconn/perl/config/dbUsers.CGP.xml
export LSB_DEFAULTGROUP="team154"

bind 'set completion-ignore-case on' 
shopt -s globstar
shopt -s autocd

shopt -s histappend
export HISTFILESIZE=
export HISTFILE=
alias ls="ls --color=always"
alias la="ls -a --color=always"
alias ll="ls -al --color=always"
alias pk="brew install"
alias v="vim"

alias zz="source ~/.bash_profile"
alias vbrc="vim /nfs/users/nfs_p/pb18/.bash_profile"

eval $(/nfs/users/nfs_p/pb18/.linuxbrew/Homebrew/bin//brew shellenv)
