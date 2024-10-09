#!/bin/bash

cd /var/www/html
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/portfolio

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

git pull origin main

npm ci

sudo -s
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
npm run build
sudo systemctl restart apache2