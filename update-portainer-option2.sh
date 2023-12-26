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

# Stop the Portainer container if it is running
portainer_id=$(docker ps -q -f name=portainer)
if [ -n "$portainer_id" ]; then
    echo "Stopping Portainer container..."
    docker stop $portainer_id || { echo "Failed to stop the Portainer container. Exiting script."; exit 1; }
    echo "Portainer container stopped."
else
    echo "Portainer container is not running."
fi

# Remove the Portainer container if it exists
if docker ps -a | grep -q portainer; then
    echo "Removing Portainer container..."
    docker rm portainer || { echo "Failed to remove the Portainer container. Exiting script."; exit 1; }
    echo "Portainer container successfully removed."
fi

# Verify that the Portainer container has been removed
if docker ps -a | grep -q portainer; then
    echo "Failed to remove the Portainer container. Exiting script."
    exit 1
else
    echo "Portainer container successfully removed."
fi

# List the contents of the specific directory
echo "Available images:"
select opt in $(ls /var/lib/docker/image/overlay2/imagedb/content/sha256); do
    if [ -n "$opt" ]; then
        image_to_delete=$opt
        break
    else
        echo "Invalid selection. Please try again."
    fi
done

# Delete the selected image
echo "Deleting image: $image_to_delete"
rm -rf "/var/lib/docker/image/overlay2/imagedb/content/sha256/$image_to_delete"

# Pull and run the latest Portainer container
echo "Now installing the updated Portainer image..."
docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer/portainer_container:/data portainer/portainer-ce:latest \
&& echo "Update process completed." \
|| echo "Failed to run Portainer container."
