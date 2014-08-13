#!/bin/sh

if [ `which node` ]; then 
    echo "node already installed";
else 
    add-apt-repository ppa:chris-lea/node.js && apt-get update && apt-get install nodejs
fi
