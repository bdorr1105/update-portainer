# update-portainer
Update Portainer docker container custom too my environment

![Update Portainer](https://github.com/bdorr1105/update-portainer/assets/12386911/9919337a-a8c7-4df2-9c67-15f6cbbebdad)

|:exclamation:  Warning   Use at your own risk!|
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Do not just execute this script in your environment, you can use it as a shell and tweak it to adapt it to your environment

## How to Use This
You can view the changes you have to make which are towards the top of the script and then in the DNS section about midway down and modify your files on box. It would be wise to make a backup before implementing any of these changes. If you opt to not edit the local files on box, still make a backup so you have the original. Then you will paste these in the perspective directories. You can also git clone the repo or download direct. Whatever you prefer.

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
