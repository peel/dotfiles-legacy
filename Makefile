# Peel environment configuration and all that
# distributed under Apache Licence

#Preconfig{
    SOFT =  vim \                   #list of directories and soft to be installed
            vimrc \
            zsh \
            tmux.conf
 
#}

#Symlinking{
link: $(SOFT)
    @for f in $(SOFT) ; do ln -s ~/.dotfiles/$$f ~/.$$f; done
#}

#Desymlinking: 
unlink: $(SOFT)
    @for f in $(SOFT) ; do rm ~/.$$f; done
#}

#Update repository{
update:
    git submodule update --init
    git pull --recurse-submodules --rebase
    git submodule foreach git reset --hard
    git submodule foreach git checkout master
    git submodule foreach git pull --rebase
    git push
}

#Tools{
tools:
    #Preconditions{
        chsh -s /bin/zsh              #use zsh instead of bash
        mkdir homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C homebrew  #homebrew
    #}

    #Shell{
        brew install tmux midnight-commander
    #}

    #Brew kegs{
        brew install git ctags-exuberant      #general purpose kegs
        brew install sbt scala                #scala kegs
        brew install maven                    #java kegs
        brew install jboss glassfish tomcat   #server stuff
        brew install mongodb                  #database stuff
        brew install scalate akka giter8      #frameworks
    #}

#}

#Install{
install: 
    link update tools
#}
