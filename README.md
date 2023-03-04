# HackRF-One-Transceiver
lorem ipsum
## Installation ##
Additional information can be found at https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

### Ubuntu Installation ###
Download and install Ubuntu 20.04.5x
  
### Docker Installation ###
Run the following commands in terminal
```
sudo apt update
```
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```
```
apt-cache policy docker-ce
```
```
sudo apt install docker-ce
```
### Confirm Docker operation ###
Enter the following commands
```
sudo systemctl status docker
```
The following prompt should appear

![image](https://user-images.githubusercontent.com/124105630/222870148-08052684-3ffc-4ed8-bdfa-948d8738e315.png)

```
sudo usermod -aG docker ${USER}
```
```
su - ${USER}
```
```
docker ps -a
```
Your current images should appear

### Creating the Docker Image and Running the Application ###
Download the Dockerfile and rundocker.sh provided above then enter the following commands 

```
docker build -t reponame/imagename - < Dockerfile
```
This will build a docker image under the repository ‘reponame’ and the image ‘imagename’ based on the Dockerfile provided or made.
```
docker images
```
You should see the repo name, image ID, size, and when it was created.

Edit “quackcomms/lora” in the rundocker.sh to be reponame/imagename and save the file

Plug in HackRF and run the included “rundocker” file
```
sudo sh rundocker.sh
```
![image](https://user-images.githubusercontent.com/124105630/222871209-256528bf-e36b-43f0-902e-66a503e179e7.png)

Open GNU Radio using the following command
```
gnuradio-companion
```






