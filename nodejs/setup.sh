#!/usr/bin/zsh

#echo "Install nodejs..."
#yaourt -S --needed nodejs
#echo "Install nodejs...DONE"

echo "Install NodeJS 6.1.0..."
cd /tmp
wget https://nodejs.org/dist/latest/node-v6.1.0-linux-x64.tar.gz
mkdir -pv ~/.nodejs
tar xzvf node-*-linux-x64.tar.gz -C ~/.nodejs/
rm node-*-linux-x64.tar.gz
ln -fs ~/.nodejs/node-v6.1.0-linux-x64 ~/.nodejs/current

if grep --quiet "# NodeJS" ~/.zshrc; then
	echo "archlinux repo already here"
else
	echo -e "\n# NodeJS" >> ~/.zshrc
	echo 'export NPM_PACKAGES=~/.npm-packages' >> ~/.zshrc
	echo 'export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH' >> ~/.zshrc
	echo 'export PATH=$NPM_PACKAGES/bin:~/.nodejs/current/bin:$PATH' >> ~/.zshrc
	echo 'unset MANPATH; export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> ~/.zshrc
fi
source ~/.zshrc
npm config set prefix `echo $NPM_PACKAGES`
echo "Install NodeJS ...DONE"
