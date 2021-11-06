# Local Mac Dev Setup Makefile

all:
	ansible-playbook main.yml -i inventory -K $(TAGS)

defaults:
	$(MAKE) all TAGS='--tags defaults'

dock:
	$(MAKE) all TAGS='--tags dock'

homebrew:
	$(MAKE) all TAGS='--tags homebrew'

iterm:
	$(MAKE) all TAGS='--tags iterm'

setup: get-collections get-roles
	ansible-galaxy install $(FORCE) -r requirements.yml

get-collections:
	ansible-galaxy collection install community.general

get-roles:
	ansible-galaxy install $(FORCE) lafarer.osx-defaults tkimball83.iterm2
