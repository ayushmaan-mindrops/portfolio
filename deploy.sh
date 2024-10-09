#!/bin/bash

cd /var/www/html
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/portfolio

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" || {
  echo "NVM is not installed. Installing now...";
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash;
  . "$NVM_DIR/nvm.sh";
  nvm install node;
}

# Check if npm is available
npm -v || {
  echo "npm is not installed, installing now...";
  nvm install node;
}

git pull origin main

npm ci

sudo -s
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
npm run build
sudo systemctl restart apache2