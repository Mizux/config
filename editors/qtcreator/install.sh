#!/usr/bin/env bash
set -e

echo "Installing qtcreator styles..."
set -x
mkdir -pv ~/.config/QtProject/qtcreator/styles
cp argonaute.xml ~/.config/QtProject/qtcreator/styles/
cp forest.xml ~/.config/QtProject/qtcreator/styles/
cp mouse.xml ~/.config/QtProject/qtcreator/styles/


