echo "Installing qibuild"
yaourt -S --needed python2-pip swig
mkdir -pv ~/.local/bin
pip2 install --user --upgrade qibuild
pip2 install --user --upgrade sphinx sphinx-intl sphinxcontrib-spelling sphinxcontrib-doxylink
pip2 install --user --upgrade pyenchant

echo "Generate ssh key"
ssh-keygen -t rsa
echo "please add: "
cat ~/.ssh/id_rsa.pub
echo "to http://gerrit.aldebaran.lan/#/settings/ssh-keys"
echo "to https://gitlab.aldebaran.lan/profile/keys"
echo "press [ENTER] to continue"
read

echo "Creating worktree..."
rm -rf ~/work
mkdir -pv ~/work/master && cd ~/work/master
qisrc init git@gitlab.aldebaran.lan:qi/manifest.git

echo "Creating toolchain"
qitoolchain create atom ftp://kiwi.aldebaran.lan/qi/toolchains/feeds/master/linux64-atom.xml
qitoolchain create linux64 ftp://kiwi.aldebaran.lan/qi/toolchains/feeds/master/linux64.xml
qitoolchain update
qitoolchain list

echo "Creating config"
qibuild add-config linux64 -t linux64
qibuild add-config nao -t atom -p nao
qibuild add-config juliette -t atom -p juliette
qibuild config

echo "Installing aldebaran worktree   DONE"
