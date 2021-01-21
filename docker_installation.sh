sudo -s << EOF
echo "libertyhound ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/libertyhound
apt update
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
docker run hello-world
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
EOF
