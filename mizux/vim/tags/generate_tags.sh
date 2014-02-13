#!/bin/bash
echo Generate tags file in the current directory

echo Generate C++ STL tags
wget -O cpp_src.tar.bz2 http://www.vim.org/scripts/download_script.php?src_id=9178
tar xf cpp_src.tar.bz2
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f cpp cpp_src
rm -rf cpp_src cpp_src.tar.bz2

echo Generate Boost tags
yaourt -Ql boost | grep -E -o '/usr/include/.*\.(h|hpp)' | grep -v '/usr/include/boost/typeof/' > boost-filelist
ctags --c++-kinds=+p --fields=+imaS --extra=+q -f boost -L boost-filelist
rm boost-filelist

echo Generate Qt4 tags
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f qt4 /usr/include/Qt

echo Generate OpenGL tags
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f opengl /usr/include/GL/

echo Generate OpenSceneGraph tags
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f osg /usr/include/osg

echo Generate Ogre tags
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f ogre /usr/include/OGRE

echo Generate Bullet tags
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f bullet /usr/include/bullet

echo Generate OpenCV tags
ctags -R --sort=foldcase --c++-kinds=+p --fields=+imaS --extra=+q --language-force=C++ -f opencv /usr/include/opencv /usr/include/opencv2

plop=$(pwd)
echo In your VIMRC:
echo \"configure tags - add additional tags here or comment out not-used ones
echo set tags+=$plop/cpp
echo set tags+=$plop/boost
echo set tags+=$plop/qt4
echo set tags+=$plop/opengl
echo set tags+=$plop/osg
echo set tags+=$plop/ogre
echo set tags+=$plop/bullet
echo set tags+=$plop/opencv
