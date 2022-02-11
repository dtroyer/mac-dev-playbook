# Local Mac Dev Setup Makefile

all:
	ansible-playbook main.yml -i inventory -K $(TAGS)

defaults:
	$(MAKE) all TAGS='--tags defaults'

dock:
	$(MAKE) all TAGS='--tags dock'

dotfiles:
	$(MAKE) all TAGS='--tags dotfiles'

homebrew:
	$(MAKE) all TAGS='--tags homebrew'

iterm:
	$(MAKE) all TAGS='--tags iterm'

ruby:
	$(MAKE) all TAGS='--tags ruby'

setup: get-collections get-roles
	ansible-galaxy install $(FORCE) -r requirements.yml

get-collections:
	ansible-galaxy collection install community.general geerlingguy.mac

get-roles:
	ansible-galaxy install $(FORCE) lafarer.osx-defaults rvm.ruby tkimball83.iterm2
