#!/bin/bash

cd ~/UsBackend/src/main/

echo "running the usbackend with new commit"
./script.sh

echo "back to root "

echo "going to trigger shop manager"
cd ~/ShopManager/src/main

echo "triggering with new commit "
./script.sh

echo "back to root"

echo "triggering the cloudgateway"

cd ~/CloudGateway/src/main

echo "triggering cloudgateway"
./script.sh

echo "everything ran beautifully working  fine  with latest commmit and ip address "
