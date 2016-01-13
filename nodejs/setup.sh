#!/usr/bin/zsh

#echo "Install nodejs and ruby..."
#yaourt -S --needed nodejs ruby
#echo "Install nodejs and ruby...DONE"

echo "Install NodeJS 5.1.0 ..."
cd /tmp
wget https://nodejs.org/dist/latest/node-v5.1.0-linux-x64.tar.gz
mkdir -pv ~/.nodejs
tar xzvf node-*-linux-x64.tar.gz -C ~/.nodejs/
rm node-*-linux-x64.tar.gz
ln -fs ~/.nodejs/node-v5.1.0-linux-x64 ~/.nodejs/current

echo -e "\n# NodeJS" >> ~/.zshrc
echo 'export NPM_PACKAGES=~/.npm-packages' >> ~/.zshrc
echo 'export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH' >> ~/.zshrc
echo 'export PATH=$NPM_PACKAGES/bin:~/.nodejs/current/bin:$PATH' >> ~/.zshrc
echo 'unset MANPATH; export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> ~/.zshrc
source ~/.zshrc
npm config set prefix `echo $NPM_PACKAGES`
echo "Install NodeJS ...DONE"

echo "Please call: source ~/.zshrc"

echo "Install npm modules..."
npm install -g gulp
#npm install -g karma bower grunt-cli phantomjs jshint
#npm install -g yo generator-angular generator-webapp
npm list -g --depth=0
echo "Install npm modules...DONE"
