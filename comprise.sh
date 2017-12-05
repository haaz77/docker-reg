#!/bin/bash
### 1 = target image you wants to comprise 
### 2 = temporary name 
set -x
ID=`docker run -d "${1}" /bin/true`
RG="10.254.154.110"
sleep 5
docker export $ID | docker import - "${2}"
docker rmi -f "${1}"
docker rmi -f $RG/"${1}"
docker rmi -f $RG/"${1}"
# for i in {1..10};
#    do "docker rmi -f $(`docker images --filter "dangling=true" -q --no-trunc`)";
# done
docker tag "${2}" "${1}"
docker tag  "${1}"  $RG/"${1}"
docker push $RG/"${1}"
docker rmi -f "${2}"
