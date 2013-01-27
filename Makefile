# Peel environment configuration and all that
# distributed under Apache Licence

SOFT =  vim vimrc zsh tmux.conf

link: $(SOFT)
	@for f in $(SOFT) ; do ln -s ~/dotfiles/$$f ~/.$$f; done
	ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
	ln -s ~/dotfiles/powerline ~/.config/powerline

unlink: $(SOFT)
	@for f in $(SOFT) ; do rm ~/.$$f; done
	rm ~/.zshrc ~/.config/powerline

update:
	git submodule update --init
	git pull --recurse-submodules --rebase
	git submodule foreach git reset --hard
	git submodule foreach git checkout master
	git submodule foreach git pull --rebase
	git push

tools:
	chsh -s /bin/zsh              #use zsh instead of bash
	mkdir homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C homebrew  #homebrew

	brew install tmux midnight-commander lynx ack
	gem install tmuxinator

	brew install git ctags-exuberant      #general purpose kegs
	brew install sbt scala                #scala kegs
	brew install maven                    #java kegs
	brew install jboss glassfish tomcat   #server stuff
	brew install mongodb                  #database stuff
	brew install scalate akka giter8      #frameworks
	brew install python

  pip install --user git+git://github.com/Lokaltog/powerline #powerline
	alias lynx="lynx -vikeys -tna -nocolor -number_fields" 

install: 
	link update tools
