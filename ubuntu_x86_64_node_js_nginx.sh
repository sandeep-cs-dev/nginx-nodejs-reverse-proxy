sudo apt-get update && apt-get upgrade -y
# node js installation 
sudo apt-get install -y build-essential
sudo apt-get install curl python-software-properties
sudo apt-get install apt-transport-https
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo node -v 
sudo npm -v 

# install nginx

sudo apt install nginx -y

# sudo ufw app list
# You should get a listing of the application profiles:

# Output
# Available applications:
#   Nginx Full
#   Nginx HTTP
#   Nginx HTTPS
#   OpenSSH 

sudo ufw allow 'Nginx Full' -y
# check updated firewall status
sudo ufw status
# check nginx status
systemctl status nginx

sudo cp /home/nginx-learning/sites-available/app1.conf /etc/nginx/sites-available/
sudo cp /home/nginx-learning/sites-available/app2.conf /etc/nginx/sites-available/
sudo cp /home/nginx-learning/sites-available/proxy.conf /etc/nginx/
sudo ln -s /etc/nginx/sites-available/app1.conf /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/app2.conf /etc/nginx/sites-enabled/

sudo service nginx reload

sudo npm install forever -g

sudo cp -vr /home/nginx-learning/apps/ /home/vagrant/

cd /home/vagrant/apps/app1 && npm install  && forever start server1.js
cd /home/vagrant/apps/app2 && npm install  && forever start server2.js

