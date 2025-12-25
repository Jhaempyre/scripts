# for docker ownership change 
# Create the docker config directory for Jenkins
sudo mkdir -p /var/lib/jenkins/.docker

# Copy YOUR credentials to the Jenkins directory
sudo cp ~/.docker/config.json /var/lib/jenkins/.docker/

# Give Jenkins ownership of that file
sudo chown -R jenkins:jenkins /var/lib/jenkins/.docker/

# for kubernetes ownership change
sudo mkdir -p /var/lib/jenkins/.kube
sudo cp ~/.kube/config /var/lib/jenkins/.kube/
sudo chown -R jenkins:jenkins /var/lib/jenkins/.kube
