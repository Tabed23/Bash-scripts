apt update -y
#Install Asterisk 18 LTS dependencies
apt -y install git curl wget libnewt-dev libssl-dev libncurses5-dev subversion  libsqlite3-dev build-essential libjansson-dev libxml2-dev  uuid-dev

#Add universe repository and install subversio
add-apt-repository universe
apt update && apt -y install subversion

#Download Asterisk 18 LTS tarball
# apt policy asterisk
cd /usr/src/
curl -O http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz

#Extract the file
tar xvf asterisk-18-current.tar.gz
# change the name


# into the directory
cd asterisk-18*/

#download the mp3 decoder library
contrib/scripts/get_mp3_source.sh

#Ensure all dependencies are resolved
contrib/scripts/install_prereq install

#Run the configure script to satisfy build dependencies
./configure

#Setup menu options by running the following command:
make menuselect

#Use arrow keys to navigate, and Enter key to select. On Add-ons select chan_ooh323 and format_mp3 . 
#On Core Sound Packages, select the formats of Audio packets. Music On Hold, select 'Music onhold file package' 
# select Extra Sound Packages
#Enable app_macro under Applications menu
#Change other configurations as required

#build Asterisk
make

#Install Asterisk by running the command:
make install

#Install documentation(Optionally)
make progdocs

#Install configs and samples
make samples
make config

#useradd -d /var/lib/asterisk/ asterisk
#chown -R asterisk. /var/spool/asterisk/ /var/lib/asterisk/ /var/run/asterisk/


#Create a separate user and group to run asterisk services, and assign correct permissions:
groupadd asterisk
useradd -r -d /var/lib/asterisk -g asterisk asterisk
usermod -aG audio,dialout asterisk
chown -R asterisk.asterisk /etc/asterisk
chown -R asterisk.asterisk /var/{lib,log,spool}/asterisk
chown -R asterisk.asterisk /usr/lib/asterisk

#Set Asterisk default user to asterisk:
nano /etc/default/asterisk

# AST_USER="asterisk"
# AST_GROUP="asterisk"
# ldconfig

nano /etc/asterisk/asterisk.conf
# runuser = asterisk ; The user to run as.
# rungroup = asterisk ; The group to run as.

#Restart asterisk service
systemctl restart asterisk

#Enable asterisk service to start on system  boot
systemctl enable asterisk

#Test to see if it connect to Asterisk CLI
#asterisk -rvv

#open http ports and ports 5060,5061 in ufw firewall
#ufw allow proto tcp from any to any port 5060,5061

