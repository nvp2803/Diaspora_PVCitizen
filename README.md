1- Update:
sudo apt-get update
sudo apt-get install build-essential curl git imagemagick libmagickwand-dev nodejs redis-server libcurl4-openssl-dev libxml2-dev libxslt-dev libpq-dev libmagickwand-dev

sudo apt-get install python-software-properties
sudo apt-add-repository ppa:jaywink/curldebian
sudo apt-get update && sudo apt-get dist-upgrade

sudo apt-add-repository ppa:chris-lea/redis-server
sudo apt-get update && sudo apt-get dist-upgrade

2- Install your database: https://help.ubuntu.com/12.04/serverguide/postgresql.html

3 - Install RVM
curl -L dspr.tk/1t | bash

4 - Setting your RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm install 2.0

5 - Dowload code
cd ~
git clone  https://github.com/nvp2803/Diaspora_PVCitizen.git
cd Diaspora_PVCitizen

6 - Configuring Database
cp config/database.yml.example config/database.yml
cp config/diaspora.yml.example config/diaspora.yml

7 - Bundle
DB=postgres  bundle install

8 - Set up database
bundle exec rake db:create db:schema:load

9 - Run diaspora:
./script/server



**Your server now is running in localhost:3000. You can change the port easily.


Armin has commit access :)
