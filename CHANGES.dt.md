# Changes by dt

I've updated GG's setup for my use, including some default config:

* Add Makefile to simplify running specific playbooks
* Add config.yml representing my common settings
* Add more-defaults.sh to handle all of the bits that osx-defaults is unable to
  (such as nested dicts)
* Use lafarer.osx-defaults for the config defaults rather than .osx
* Use tkimball83.iterm2 to configure iTerm2 defaults

# Branches

* dt-master contains my common changes periodically rebased on upstream master
* <hostname> contains the specific host configs over dt-master
