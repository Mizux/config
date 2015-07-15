#!/bin/env bash
echo "Install nodejs and ruby..."
yaourt -S --needed nodejs ruby
echo "Install nodejs and ruby...DONE"

echo "Install env to .zshrc..."
npmdir="${HOME}/.npm-packages"
envfix='
NPM_PACKAGES="%s"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
'
printf "${envfix}" ${npmdir} >> ~/.zshrc
echo "Install env to .zshrc...DONE"

echo "Install npm modules..."
source ~/.zshrc
npm install -g yo karma bower grunt-cli phantomjs jshint # yeoman
npm install -g generator-angular generator-webapp
echo "Install npm modules...DONE"
