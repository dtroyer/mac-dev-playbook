# Local Mac Dev Setup Makefile

all:
	ansible-playbook main.yml -i inventory -K

ruby:
	ansible-playbook ruby.yaml -i inventory -K

iterm:
	ansible-playbook iterm.yaml -i inventory -K

setup: get-roles
	ansible-galaxy install -r requirements.yml

get-roles:
	ansible-galaxy install rvm.ruby tkimball83.iterm2
