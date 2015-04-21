Build
=====

Create VirtualBox VM
  4 GB disk
  Turn off audio
  Network / Port Forwarding
    SSH: 2222 -> 22 (leave IPs blank)
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


Install Packages (via `ssh -p 2222 vagrant@127.0.0.1`)
----------------

~~~ bash
sudo apt-get update
sudo apt-get upgrade
sudo init 6
sudo apt-get install telnet netcat
sudo apt-get install wget curl httpie
sudo apt-get install lynx links elinks w3m
sudo apt-get install vim emacs nano
sudo apt-get install nginx
sudo apt-get install squid3 squidclient privoxy polipo
sudo apt-get install ruby ruby-dev bundler
sudo apt-get install tmux
sudo apt-get install git

~~~

* Edit ``
  * Uncomment `acl localnet src 10.0.0.0/8`
  * Uncomment `http_access allow localnet`
  * Add `request_header_access User-Agent deny all`
  * Add `reply_header_access Date deny all`
  * Add `request_header_add User-Agent "HTTP Exploration - RailsConf" all`
  * Add `reply_header_replace Date "RailsConf Day 3"`

TODO:

~~~
git clone https://github.com/orangejulius/you-too-can-be-a-webserver.git
sudo service squid3 start
~~~

~~~ bash
rm ~/.bash_history
sudo rm ~root/.bash_history
sudo init 0
~~~


Create Vagrant Box
------------------

vagrant package --base 'HTTP Exploration' --output http_exploration.box
vagrant 
vagrant up
vagrant ssh



Notes
-----

squid - port 3128
