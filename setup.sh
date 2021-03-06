#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade

read -p "Install vim, htop, ssh, 7z, tmux, and git? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt-get install vim htop openssh-server git tmux p7zip-full
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

read -p "Install pyenv? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev
	source ~/.bashrc
fi

read -p "Generate ssh key? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	ssh-keygen -t ed25519
fi

read -p "Configure iptables? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
	sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
	sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
	sudo iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT
	sudo iptables -I INPUT 1 -i lo -j ACCEPT
	sudo iptables -P INPUT DROP
	sudo apt-get install iptables-persistent
fi

read -p "Install UI? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo add-apt-repository ppa:klaus-vormweg/awesome
	sudo apt-get update
	sudo apt-get install lightdm awesome rxvt-unicode-256color pcmanfm
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get update
	sudo apt-get install google-chrome-stable
fi
