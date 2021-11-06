# Local Mac Dev Setup Makefile

all:
	ansible-playbook main.yml -i inventory -K $(TAGS)

dock:
	$(MAKE) all TAGS='--tags dock'

homebrew:
	$(MAKE) all TAGS='--tags homebrew'

setup: get-collections
	ansible-galaxy install $(FORCE) -r requirements.yml

get-collections:
	ansible-galaxy collection install community.general
