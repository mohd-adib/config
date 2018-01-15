sudo su root
passwd root
vim /etc/ssh/sshd_config
PermitRootLogin prohibit-password -> PermitRootLogin yes
PasswordAuthentication no -> PasswordAuthentication yes
service sshd restart

adduser deployer && gpasswd -a deployer sudo
su deployer

export LANGUAGE=en_US.UTF-8 && export LANG=en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && sudo locale-gen en_US.UTF-8 && sudo dpkg-reconfigure locales

sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get upgrade

sudo apt-get install apt-transport-https dirmngr libgdbm-dev libncurses5-dev automake libtool bison libffi-dev git nodejs rng-tools curl dirmngr ufw git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
source /etc/profile.d/rvm.sh
rvm install 2.5.0 && rvm use 2.5.0 --default

echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem install rails

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node

curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && sudo apt-get install -y nodejs

sudo apt-get update && sudo apt-get install nginx

sudo apt-get -y install postgresql postgresql-contrib libpq-dev
sudo pg_createcluster 9.3 main --start
sudo -u postgres createuser deployer -s
sudo -u postgres psql
postgres=# \password deployer
postgres=# \q

rails g capistrano:nginx_puma:config

/etc/init
/etc/init
/etc/init
wget https://raw.githubusercontent.com/mohd-adib/config/master/puma.conf
wget https://raw.githubusercontent.com/mohd-adib/config/master/puma-manager.conf

