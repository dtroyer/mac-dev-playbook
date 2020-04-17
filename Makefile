# Local Mac Dev Setup Makefile

all:
	ansible-playbook main.yml -i inventory -K

iterm:
	ansible-playbook iterm.yaml -i inventory -K

setup: get-roles
	ansible-galaxy install -r requirements.yml

get-roles:
	ansible-galaxy install tkimball83.iterm2
