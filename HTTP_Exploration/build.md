Build
=====

Create VirtualBox VM
  4 GB disk
  Turn off audio
  Network / Port Forwarding
    SSH: 2222 -> 22 (leave IPs blank)
    HTTP: 3333 -> 3000 (leave IPs blank)
    HTTPS: 4444 -> 3000 (leave IPs blank)
Install Debian Jessie
  Default "Install" from boot menu
  Root password: vagrant
  User: Vagrant
  Password: vagrant
  Partitioning: Use Whole Disk
  Task Selection: SSH Server, Standard Utilities
Insert Guest Additions CD
Log into VM as root
  mkdir -p ~vagrant/.ssh
  wget -O ~vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
  chown -R vagrant:vagrant ~vagrant/.ssh
  chmod 700 ~vagrant/.ssh
  chmod 600 ~vagrant/.ssh/authorized_keys
  cat ~vagrant/.ssh/authorized_keys
  apt-get install sudo
  visudo
    # Verify no `requiretty`
    # Add `vagrant ALL=(ALL) NOPASSWD: ALL`
  vim /etc/ssh/sshd_config
    # Add `UseDNS no`
  apt-get install build-essential dkms
  mount /media/cdrom
  sh /media/cdrom/VBoxLinuxAdditions.run
  umount /media/cdrom


Install and Configure (via `ssh -p 2222 vagrant@127.0.0.1`)
---------------------

~~~ bash
sudo apt-get update
sudo apt-get upgrade
sudo init 6
sudo apt-get install telnet netcat
sudo apt-get install tcpdump
sudo apt-get install wget curl httpie
sudo apt-get install lynx links elinks w3m
sudo apt-get install vim emacs nano
sudo apt-get install nginx
sudo apt-get install squid3 squidclient privoxy polipo
sudo apt-get install siege apache2-utils
sudo apt-get install ruby ruby-dev
sudo apt-get install tmux
sudo apt-get install git

# Squid
sudo service squid3 stop
sudo sh -c 'cat >> /etc/squid3/squid.conf' <<EOF
acl localnet src 10.0.0.0/8
http_access allow localnet
request_header_access User-Agent deny all
reply_header_access Date deny all
request_header_add User-Agent "HTTP Exploration - RailsConf" all
reply_header_replace Date "RailsConf Day 3"
EOF
sudo service squid3 start

# Rails
sudo apt-get install libxml2-dev zlib1g-dev
sudo gem install railties bundler
rails new -O -S -d none -J --skip-turbolinks rails_app
cd rails_app
cat > Gemfile <<GEMFILE
gem 'rails', '4.2.1'
GEMFILE
bundle
rails g controller main index reflect redirect post
cat > config/routes.rb <<ROUTES
Rails.application.routes.draw do
  root 'main#index'
  get  'reflect'  => 'main#reflect'
  get  'redirect' => 'main#redirect'
  post 'post'     => 'main#post'
end
ROUTES
cat > app/controllers/main_controller.rb <<CONTROLLER
class MainController < ApplicationController

  def index
   render text: "Hello, World!\n", content_type: "text"
  end

  def reflect
    request_headers = request.headers.map{|k,v| "#{k}: #{v}"}.join("\n")
    render text: "<h1>Hello, World!</h1><pre><code>#{request_headers}</code></pre>\n".html_safe
  end

  def redirect
    redirect_to "https://www.google.com/"
  end

  def post

  end

end
CONTROLLER
cat > Gemfile <<GEMFILE
gem 'rails', '4.2.1'
GEMFILE
sudo sh -c 'cat > /etc/systemd/system/rails_app.service' <<'SYSTEMD'
[Unit]
Description=Rails application
After=network.target

[Service]
User=vagrant
WorkingDirectory=/home/vagrant/rails_app
ExecStart=/home/vagrant/rails_app/bin/rails server
ExecStop=/bin/kill $(cat tmp/pids/server.pid)

[Install]
WantedBy=multi-user.target
SYSTEMD
sudo service rails_app start
sudo systemctl enable rails_app.service
cd -

# Use a more vibrant HTTPie color scheme.
sed -ie 's|^.*default_options.*$|    "default_options": ["--style=igor"],|' ~/.httpie/config.json

# Compile latest OpenSSL - required for ALPN support for cURL below
wget https://www.openssl.org/source/openssl-1.0.2a.tar.gz
tar xfz openssl-1.0.2a.tar.gz
cd openssl-1.0.2a/
./config
make
sudo make install
cd -

# Compile latest cURL - required for HTTP/2 and SPDY support
sudo apt-get install nghttp2 libnghttp2-dev
sudo apt-get install libssl-dev
wget http://curl.haxx.se/download/curl-7.41.0.tar.gz
tar xfz curl-7.41.0.tar.gz
cd curl-7.41.0/
./configure --with-nghttp2 --with-ssl
make
sudo make install
cd -

~~~


TODO:

~~~

# Config nginx for SSL and SPDY
...
sudo service nginx checkconfig


# Restart nginx
sudo service nginx restart

# SSL Certs
yes "" | openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 3560 -nodes
sudo mv *.pem /etc/nginx/
sudo chown root:root /etc/nginx/*.pem
sudo chmod 600 /etc/nginx/*.pem

#

~~~

~~~ bash
rm ~vagrant/.bash_history
sudo rm ~root/.bash_history
sudo init 0
~~~



Create Vagrant Box
------------------

rm -f http_exploration.box
rm -f Vagrantfile
vagrant box remove http_exploration
vagrant package --base 'HTTP Exploration' --output http_exploration.box
vagrant init --minimal http_exploration ./http_exploration.box
# Edit Vagrantfile:
  config.vm.network "forwarded_port", guest: 3000, host: 3333, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 4444, auto_correct: true
  config.ssh.insert_key = false # Work-around for https://github.com/mitchellh/vagrant/issues/5186                               
cp http_exploration.box http_exploration.box.NEW_GOOD
vagrant up
vagrant ssh
vagrant halt


Notes
-----


