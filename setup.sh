sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:klaus-vormweg/awesome
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim htop openssh-server git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
source ~/.bashrc

ssh-keygen -t ed25519

sudo apt-get install lightdm awesome rxvt-unicode-256color pcmanfm
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
