# update-portainer
Update Portainer docker container custom too my environment

![Update Portainer](https://github.com/bdorr1105/update-portainer/assets/12386911/3ef8b651-ebfe-4db2-a062-1c1ebcd6bf35)

|:exclamation:  Warning   This script will stop every running container, if you do not want to do that, please modify. Use at your own risk!|
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Do not just execute this script in your environment, you can use it as a shell and tweak it to adapt it to your environment

## How to Use This
I recommend just git cloning the repo, changing directory into it and modifying the parts of the script that you need to for your environment. 

## If you don't mind stoppong all your containers
DO NOT USE the update-portainer-option2.sh

## If you only want to stop Portainer
Use the update-portainer-option2.sh

### Clone this repository to your local machine:
`git clone https://github.com/bdorr1105/update-portainer.git`

## Modify this portion to the way you installed your portainer container originally
```docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer/portainer_data:/data portainer/portainer-ce:latest \ ```

## Change Directory into the update-portainer directory and make the script executable 
```chmod +x update-portainer ```

|:exclamation:  Warning   PLEASE MAKE SURE YOU HAVE THE CORRECT SHA256 IMAGE PATH!|
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
## Before execution, double check what the image path is. You can find this in portainer under images. Find the one for portainer. See the Image below
![portainer images](https://github.com/bdorr1105/update-portainer/assets/12386911/164d585f-5c8d-4a5c-8620-b8147d2a927d)

## Contributions
Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please feel free to create a pull request or submit an issue on the GitHub repository.
