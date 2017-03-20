sudo apt-get install docker-engine wget
sudo groupadd docker
sudo usermod -aG docker $USER

wget -c \
https://raw.githubusercontent.com/joyxu/docker-my-dev-env/master/dockerfile \
&& cat dockerfile | sudo docker build -
