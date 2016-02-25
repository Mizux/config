# Installing pynaoqi
```sh
cd && wget ftp://.../pynaoqi-python2.7-X-linux64.tar.gz
tar xzvf pynaoqi*.tar.gz && rm pynaoqi*.tar.gz
ln -s pynaoqi-* pynaoqi
```
to test:
```sh
python2 -c "import qi"
```
#Nautilus OpenTerminalHere using urxvt:
urxvt -e /bin/sh -c 'cd %D && /bin/zsh'
