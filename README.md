# HackRF-One-Receiver
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

# HackRF-One-Transceiver #
The following steps are adapted from the installation steps mentioned in Tapparelj's Tutorial (https://github.com/tapparelj/gr-lora_sdr)
## Installation
Enter the following commands in terminal
The conda environment used to develop this module is described by the environment.yml file. 

- Clone this repository
	```sh
	git clone https://github.com/tapparelj/gr-lora_sdr.git
	```
- Go to the cloned repository
	```sh
	cd gr-lora_sdr/
	```
- A functionning environment with all dependencies can be installed with conda.
	You can follow this [tutorial](https://www.how2shout.com/how-to/install-anaconda-wsl-windows-10-ubuntu-linux-app.html) or simply following:
	- First download the latest release of conda, for example:
		```sh
		wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
		```
	- Now run the downloaded file which is the Anaconda Installer script
		```sh
	 	bash Miniconda3-py39_4.12.0-Linux-x86_64.sh
		```
	- And reload the Shell
		```sh
		source ~/.bashrc
		```
	- Now copy our environment to install all the dependencies of the module automatically. Note that it will take quite some time (~20 min).
		```sh
		conda env create -f environment.yml 
		```
	- Start the conda environment GNU Radio 3.10 you just created
		```sh
		conda activate gr310
		```
- To build the code, create an appropriate folder and go in it:
	```sh
	mkdir build
	cd build
	```
- Run the main CMakeLists.txt
	```sh
	cmake .. -DCMAKE_INSTALL_PREFIX=<your prefix> # default to usr/local, CONDA_PREFIX or PYBOMB_PREFIX if no install prefix selected here
	```
- Finally compile the custom GNU Radio blocks composing the LoRa transceiver. Replacing \<X> with the number of core you want to use to speed up the compilation.
	```sh
	(sudo) make install -j<X>
	```
- if you installed as sudo run
	```sh
	sudo ldconfig 
	```
- Now you should be able to run some codes. For example, open the GNU Radio Companion user interface and check if the blocks of gr-lora_sdr are available on the blocks list (e.g. under LoRa_TX).
	```sh
	gnuradio-companion &
	```
- A final verification of the transceiver functionning can be made by executing the following script, transmitting a frame every two seconds:
	```sh
	python3 examples/tx_rx_functionnality_check.py 
	```
Using `lora_TX.grc` and `lora_RX.grc` you can now transmit and recieve information to/from your ducks.
