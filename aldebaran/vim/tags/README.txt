C++ STL:
http://vim.wikia.com/index.php?title=Special:Outbound&f=C%2B%2B_code_completion&u=http%3A%2F%2Fwww.vim.org%2Fscripts%2Fscript.php%3Fscript_id%3D2358
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f cpp cpp_src

BOOST (1.4Go):
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f boost /usr/include/boost
or (~350Mo)
yaourt -Ql boost | grep -E -o '/usr/include/.*\.(h|hpp)' | grep -v '/usr/include/boost/typeof/' > ~/.vim/tags/boost-filelist
ctags --c++-kinds=+p --fields=+imaS --extra=+q -f boost -L ~/.vim/tags/boost-filelist

QT4:
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f qt4 /usr/include/Qt

OpenGL:
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f gl /usr/include/GL/

OSG:
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f osg /usr/include/osg

OGRE:
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f ogre /usr/include/ogre

Bullet:
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f bullet /usr/include/bullet

OpenCV/OpenCV2:
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f opencv /usr/include/opencv /usr/include/opencv2

VIMRC
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/boost
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/osg
set tags+=~/.vim/tags/ogre
set tags+=~/.vim/tags/bullet
set tags+=~/.vim/tags/opencv
