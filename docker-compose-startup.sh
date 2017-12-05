#!/bin/bash
cd /root/projects/private-registry/
/usr/local/bin/docker-compose up -d
sleep 60
/usr/bin/docker login -u saif -p kaust@123 10.254.154.110
