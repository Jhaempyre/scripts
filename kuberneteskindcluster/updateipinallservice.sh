#!/bin/bash

# Get the Internal IP (Local Network)
# 'hostname -I' returns all IPs; 'awk' grabs the first one
INTERNAL_IP=$(hostname -I | awk '{print $1}')

#Get the external ip for updating everywhere
PUBLIC_IP=$(curl -s https://ifconfig.me)

echo "------------------------------------------"
echo "Machine IP Information:"
echo "Internal (Local) IP: $INTERNAL_IP"
echo "Public (Internet) IP: $PUBLIC_IP"
echo "------------------------------------------"


# setting stage

echo "setting github ssh-agent for auto commit and push"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/meditoxserver
ssh -T git@github.com
echo "the agent is configured"


echo "----------updating usbackend service--------"

# Define the path to the properties file
FILE_PATH="UsBackend/src/main/resources/application.properties"

# 3. Check if the file exists before trying to edit
if [ -f "$FILE_PATH" ]; then
    echo "Updating IP in $FILE_PATH to: $PUBLIC_IP"

    # Use sed to find the jdbc:postgresql line and replace the IP address
    # This regex looks for digits.digits.digits.digits
    sed -i "s/jdbc:postgresql:\/\/[0-9.]*:/jdbc:postgresql:\/\/$PUBLIC_IP:/" "$FILE_PATH"

    echo "Done! New line looks like:"
    grep "spring.datasource.url" "$FILE_PATH"
else
    echo "Error: File $FILE_PATH not found. Are you in the parent directory?"
fi

echo "pushing ip update to github"
echo "changing directory"
cd ~/UsBackend/
git add .
git commit -m "The ip address has been changed to server ip:This is a auto commit from server"
git push
echo "going back"
cd ..
echo "pushing to remote directory at github.com is done"

echo "-------updation complete for usbackend------"

echo "----------updating shopmanager service--------"

# Define the path to the properties file
FILE_PATH="ShopManager/src/main/resources/application.properties"

# 3. Check if the file exists before trying to edit
if [ -f "$FILE_PATH" ]; then
    echo "Updating IP in $FILE_PATH to: $PUBLIC_IP"

    # Use sed to find the jdbc:postgresql line and replace the IP address
    # This regex looks for digits.digits.digits.digits
    sed -i "s/jdbc:postgresql:\/\/[0-9.]*:/jdbc:postgresql:\/\/$PUBLIC_IP:/" "$FILE_PATH"

    # Update the Auth API URL
    # This matches the start of the URL and replaces the IP before the port
    sed -i "s/service.api.auth.url = http:\/\/[0-9.]*:/service.api.auth.url = http:\/\/$PUBLIC_IP:/" "$FILE_PATH"
    echo "Done! New line looks like:"
    grep "spring.datasource.url|service.api.auth.url" "$FILE_PATH"
else
    echo "Error: File $FILE_PATH not found. Are you in the parent directory?"
fi

echo "pushing ip update to github"
echo "changing directory"
cd ~/ShopManager/
git add .
git commit -m "The ip address has been changed to server ip:This is auto commit from server"
git push
echo "going back"
cd ..
echo "pushing to remote directory at github.com is done"

echo "-------updation complete for shopmanager------"


echo "----------updating cloudgateway service--------"

# Define the path to the properties file
FILE_PATH="CloudGateway/src/main/resources/application.yml"

# 3. Check if the file exists before trying to edit
if [ -f "$FILE_PATH" ]; then
    echo "Updating IP in $FILE_PATH to: $PUBLIC_IP"

    # Use sed to find the jdbc:postgresql line and replace the IP address
    # This regex looks for digits.digits.digits.digits
    # Update the single variable at the top
    # This looks for 'server-ip:' and replaces everything after it
    sed -i "s/server-ip: .*/server-ip: $PUBLIC_IP/" "$FILE_PATH"

    echo "Done! New line looks like:"
    grep "server-ip" "$FILE_PATH"
else
    echo "Error: File $FILE_PATH not found. Are you in the parent directory?"
fi

echo "pushing ip update to github"
echo "changing directory"
cd ~/CloudGateway/
git add .
git commit -m "The ip address has been changed to server ip:This is auto commit from server"
git push
echo "going back"
cd ..
echo "pushing to remote directory at github.com is done"
echo "-------updation complete for cloudgateway------"
