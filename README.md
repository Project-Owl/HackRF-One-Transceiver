# HackRF-One-Transceiver
This repo will give the user everything they need to configure their HackRF One to communicate with their existing CDP network.
## Installation ##
Additional information can be found at https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

### Ubuntu Installation ###
Download and install Ubuntu 20.04.5x
<br> A useful tutorial can be found here https://youtu.be/x5MhydijWmc
  
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

## Creating the Docker Image and Running the Application ##
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
![image](https://user-images.githubusercontent.com/124105630/222871651-82c2cb24-f74f-48a9-8f57-c2f37530c327.png)

### Generating and running the file ###
Click the "File" drop down located in the top left of the window. 
<br> Open Apps `lora_receive_realtime.grc`.
Press "Generate” then “Run”. 
Open the terminal to see the message receiving output

![image](https://user-images.githubusercontent.com/124105630/222921858-4bd8b638-b6ef-4a93-b5f0-1ba121a65825.png)

Turn on DuckLink and connect to it on your phone.
<br> Send a message through the DuckLink that you should see received on the terminal.

![image](https://user-images.githubusercontent.com/124105630/222922484-5ee8397e-ce9f-4f23-90cd-82df131f0707.png)



































