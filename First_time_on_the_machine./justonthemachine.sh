## when you are on the machine you should not work as root but instead you should create a user with sudo preivelage just like this 

sudo adduser username

##it will prompt for password provide it and then 
sudo usermod -aG sudo username
##it adds sudo privelages 

#Hold on login with this username 
 su - username
 ##add the password ....


 ## now do 
 sudo apt update 
 sudo apt upgrade
