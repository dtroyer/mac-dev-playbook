# Local Mac Dev Setup Makefile

all:
	ansible-playbook main.yml -i inventory -K $(TAGS)

defaults:
	ansible-playbook osx-defaults.yaml -i inventory -K

dock:
	$(MAKE) all TAGS='--tags dock'

homebrew:
	$(MAKE) all TAGS='--tags homebrew'

ruby:
	ansible-playbook ruby.yaml -i inventory -K

iterm:
	ansible-playbook iterm.yaml -i inventory -K

ruby:
	ansible-playbook ruby.yaml -i inventory -K

setup: get-roles
	ansible-galaxy install -r requirements.yml

get-collections:
	ansible-galaxy collection install community.general

get-roles:
	ansible-galaxy install rvm.ruby tkimball83.iterm2
