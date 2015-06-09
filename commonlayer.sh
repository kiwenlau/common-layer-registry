#!/bin/bash

# find images which share common layers with registy 0.9.1 and 2.0.1

# get the bottom layer id of kiwenlau/registry:2.0.1
docker history -q kiwenlau/registry:2.0.1 >> temp.txt
bottomid=`tail -1 temp.txt`
rm temp.txt

imagelist=(radial/axle-base sequenceiq/sultans-bin kiwenlau/haproxy sequenceiq/cb-shell tutum/dnsutils tutum/node-metrics tutum/container-metrics centurylink/ruby-base cpuguy83/ipsec joaodubas/multilevel centurylink/drupal kiwenlau/jruby joaodubas/openjdk kiwenlau/mono tutum/glassfish guilhem/jenkins-slave tutum/quickstart-python jplock/exhibitor pinterb/ubuntu-perl pinterb/swagger-editor sequenceiq/serf sequenceiq/dnsmasq joaodubas/gocd-base joaodubas/gocd-agent sequenceiq/drill pinterb/ubuntu-perl-dev joaodubas/devmachine centurylink/buildpack-runner kiwenlau/gcc joaodubas/gocd-server tutum/buildstep)

echo "images which share common layers with registry 2.0.1"

for imagename in ${imagelist[*]};
do
	var=`docker history -q $imagename:latest | grep $bottomid`
        if [ "$var" == $bottomid ]
        then
		echo -e "$imagename:latest\n"
        fi
done


# get the bottom layer id of kiwenlau/registry:0.9.1
docker history -q kiwenlau/registry:0.9.1 >> temp.txt
bottomid=`tail -1 temp.txt`
rm temp.txt


echo "images which share common layers with registry 0.9.1"

for imagename in ${imagelist[*]};
do
        var=`docker history -q $imagename:latest | grep $bottomid`
        if [ "$var" == $bottomid ]
        then
                echo -e "$imagename:latest\n"
        fi
done


