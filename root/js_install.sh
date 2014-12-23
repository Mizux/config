#!/bin/env bash
echo "Install nodejs and ruby..."
yaourt -S --needed nodejs ruby

echo "Install npm modules..."
npm install -g yo karma bower grunt-cli # yeoman
npm install -g generator-angular generator-webapp
