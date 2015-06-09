#!/bin/bash

# find images which share common layers with registy 0.9.1 and 2.0.1

# get the bottom layer id of kiwenlau/registry:2.0.1
docker history -q kiwenlau/registry:2.0.1 >> temp.txt
bottomid=`tail -1 temp.txt`
rm temp.txt

imagelist=(busybox gcc)

echo "images which share common layers with registry 2.0.1"

for imagename in ${imagelist[*]};
do
	var=`docker history -q tutum/$imagename:latest | grep $bottomid`
        if [ "$var" == $bottomid ]
        then
		echo -e "tutum/$imagename:latest\n"
        fi
done


# get the bottom layer id of kiwenlau/registry:0.9.1
docker history -q kiwenlau/registry:0.9.1 >> temp.txt
bottomid=`tail -1 temp.txt`
rm temp.txt


echo "images which share common layers with registry 0.9.1"

for imagename in ${imagelist[*]};
do
        var=`docker history -q tutum/$imagename:latest | grep $bottomid`
        if [ "$var" == $bottomid ]
        then
                echo -e "tutum/$imagename:latest\n"
        fi
done


