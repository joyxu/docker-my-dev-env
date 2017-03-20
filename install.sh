sudo apt-get install docker-engine wget
sudo groupadd docker
sudo usermod -aG docker $USER

wget -c dockerfile
cat dockerfile | sudo docker build -
