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

bind 'set completion-ignore-case on'
shopt -s globstar
shopt -s autocd

shopt -s histappend
export HISTFILESIZE=
export HISTFILE=


alias pk="brew install"
alias v="vim"

alias zz="source ~/.bash_profile"
alias vbrc="vim ~/.bash_profile"

if [ "$(uname)" == "Darwin" ]; then

	export PATH=/users/pb18/homebrew/Library/Homebrew/vendor/portable-ruby/current/bin:$PATH # add Ruby to path (Homebrew needs Ruby to run)
	export PATH="/users/pb18/homebrew/bin/:$PATH" # add programs installed by homebrew
	alias ls="ls -G" # ls with color (-G gives color)
	alias la="ls -aG" # color ls for hidden files too
	alias ll="ls -alG" # color ls for hidden files, as a list (showing permission information + sizes of files)
	alias piphb="/Users/pb18/homebrew/bin/python3 -m pip"
	alias pyhb="/Users/pb18/homebrew/bin/python3"

	# added by Anaconda3 2019.07 installer
	# >>> conda init >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/pb18/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
	if [ $? -eq 0 ]; then
		\eval "$__conda_setup"
	else
		if [ -f "/Users/pb18/anaconda3/etc/profile.d/conda.sh" ]; then
			. "/Users/pb18/anaconda3/etc/profile.d/conda.sh"
			CONDA_CHANGEPS1=false conda activate base
		else
			\export PATH="/Users/pb18/anaconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda init <<<
else
	-export PATH=/nfs/users/nfs_p/pb18/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin:$PATH # add Ruby to path (Homebrew needs Ruby to run)
	-export PATH="/nfs/users/nfs_p/pb18/.linuxbrew/Homebrew/bin/:$PATH" # add programs installed by homebrew
	alias ls="ls --color=always"
	alias la="ls -a --color=always"
	alias ll="ls -al --color=always"

	export PATH="$PATH:/software/CGP/bin" # add CASM programs to PATH
	export DATABASECONNCONFIG=/software/CGP/projects/databaseconn/perl/config/dbUsers.CGP.xml
	export LSB_DEFAULTGROUP="team154"
	eval $(/nfs/users/nfs_p/pb18/.linuxbrew/Homebrew/bin//brew shellenv)

fi



