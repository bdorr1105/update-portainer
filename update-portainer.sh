#!/bin/bash

# Clear the screen
clear

# Display ASCII art banner
echo "────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo "─██████████████─██████████████─████████████████───██████████████─██████████████─██████████─██████──────────██████─██████████████─████████████████───"
echo "─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░██─██░░██████████──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───"
echo "─██░░██████░░██─██░░██████░░██─██░░████████░░██───██████░░██████─██░░██████░░██─████░░████─██░░░░░░░░░░██──██░░██─██░░██████████─██░░████████░░██───"
echo "─██░░██──██░░██─██░░██──██░░██─██░░██────██░░██───────██░░██─────██░░██──██░░██───██░░██───██░░██████░░██──██░░██─██░░██─────────██░░██────██░░██───"
echo "─██░░██████░░██─██░░██──██░░██─██░░████████░░██───────██░░██─────██░░██████░░██───██░░██───██░░██──██░░██──██░░██─██░░██████████─██░░████████░░██───"
echo "─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░░░██───────██░░██─────██░░░░░░░░░░██───██░░██───██░░██──██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───"
echo "─██░░██████████─██░░██──██░░██─██░░██████░░████───────██░░██─────██░░██████░░██───██░░██───██░░██──██░░██──██░░██─██░░██████████─██░░██████░░████───"
echo "─██░░██─────────██░░██──██░░██─██░░██──██░░██─────────██░░██─────██░░██──██░░██───██░░██───██░░██──██░░██████░░██─██░░██─────────██░░██──██░░██─────"
echo "─██░░██─────────██░░██████░░██─██░░██──██░░██████─────██░░██─────██░░██──██░░██─████░░████─██░░██──██░░░░░░░░░░██─██░░██████████─██░░██──██░░██████─"
echo "─██░░██─────────██░░░░░░░░░░██─██░░██──██░░░░░░██─────██░░██─────██░░██──██░░██─██░░░░░░██─██░░██──██████████░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─"
echo "─██████─────────██████████████─██████──██████████─────██████─────██████──██████─██████████─██████──────────██████─██████████████─██████──██████████─"
echo "────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo "──────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo "─██████──██████─██████████████─████████████───██████████████─██████████████─██████████████─████████████████───"
echo "─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░████─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───"
echo "─██░░██──██░░██─██░░██████░░██─██░░████░░░░██─██░░██████░░██─██████░░██████─██░░██████████─██░░████████░░██───"
echo "─██░░██──██░░██─██░░██──██░░██─██░░██──██░░██─██░░██──██░░██─────██░░██─────██░░██─────────██░░██────██░░██───"
echo "─██░░██──██░░██─██░░██████░░██─██░░██──██░░██─██░░██████░░██─────██░░██─────██░░██████████─██░░████████░░██───"
echo "─██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─██░░░░░░░░░░░░██───"
echo "─██░░██──██░░██─██░░██████████─██░░██──██░░██─██░░██████░░██─────██░░██─────██░░██████████─██░░██████░░████───"
echo "─██░░██──██░░██─██░░██─────────██░░██──██░░██─██░░██──██░░██─────██░░██─────██░░██─────────██░░██──██░░██─────"
echo "─██░░██████░░██─██░░██─────────██░░████░░░░██─██░░██──██░░██─────██░░██─────██░░██████████─██░░██──██░░██████─"
echo "─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░████─██░░██──██░░██─────██░░██─────██░░░░░░░░░░██─██░░██──██░░░░░░██─"
echo "─██████████████─██████─────────████████████───██████──██████─────██████─────██████████████─██████──██████████─"
echo "──────────────────────────────────────────────────────────────────────────────────────────────────────────────"

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Find the image used by the Portainer container
portainer_image=$(docker inspect portainer --format='{{.Config.Image}}' 2>/dev/null)
portainer_image_id=$(docker inspect portainer --format='{{.Image}}' 2>/dev/null)

if [ -n "$portainer_image" ] && [ -n "$portainer_image_id" ]; then
    echo "Portainer container image: $portainer_image"
    echo "Image SHA256 digest: $portainer_image_id"

    # Prompt for confirmation to delete the image
    echo -n "Are you sure you want to delete the image $portainer_image with SHA256 $portainer_image_id? [y/N] "
    read confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Image deletion cancelled. Exiting script."
        exit 0
    fi
else
    echo "No Portainer container image found or Portainer container does not exist. Exiting script."
    exit 1
fi

# Stop all Docker containers
echo "Stopping all Docker containers..."
docker ps -a -q | xargs -r docker stop -t 30

# Check if any containers are still running
while true; do
    if [ -z "$(docker ps -q)" ]; then
        echo "All Docker containers have been stopped."
        break
    else
        echo "Waiting for containers to stop..."
        sleep 5
    fi
done

# Remove the Portainer container if it exists
if docker ps -a | grep -q portainer; then
    echo "Removing Portainer container..."
    docker rm portainer || { echo "Failed to remove the Portainer container."; exit 1; }
    echo "Portainer container successfully removed."
fi

# Delete the image
echo "Deleting image: $portainer_image (SHA256: $portainer_image_id)"
docker rmi "$portainer_image_id" || { echo "Failed to delete the image."; exit 1; }
echo "Image successfully deleted."

# Pull and run the latest Portainer container
echo "Now installing the updated Portainer image..."
docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer/portainer_data:/data portainer/portainer-ce:latest
#docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer/portainer_container:/data portainer/portainer-ce:latest \

# Check if the Docker run command succeeded
if [ $? -eq 0 ]; then
    echo "Update process completed."
else
    echo "Failed to run Portainer container."
fi

