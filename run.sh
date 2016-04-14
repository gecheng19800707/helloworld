#!/bin/bash

git pull git@github.com:gecheng19800707/helloworld master
rm /etc/puppet/modules/ntp -rf
cp /root/git/helloworld/ntp /etc/puppet/modules/ -rf 
