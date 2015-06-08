#!/bin/bash

# get the bottom layer id of kiwenlau/registry:2.0.1
docker history -q kiwenlau/registry:2.0.1 >> temp.txt
bottomid=`tail -1 temp.txt`
rm temp.txt

#imagelist=(busybox haproxy aerospike oraclelinux julia crux tomcat crate wordpress golang jruby clojure jenkins iojs pypy ruby maven sentry rails hipchatbot pam glassfish dnsmasq drill build gcc)

#imagelist=(aerospike celery crux elasticsearch golang httpd jenkins mageia mono odoo php rabbitmq registry thrift websphere-liberty alpine centos debian fedora haproxy hylang jetty mariadb mysql opensuse php-zendserver rails rethinkdb tomcat wordpress buildpack-deps cirros django gcc haskell iojs jruby maven neurodebian oraclelinux postgres rakudo-star ruby ubuntu busybox clojure docker-dev ghost hello-world irssi julia memcached nginx percona pypy r-base sentry ubuntu-debootstrap cassandra crate drupal glassfish hipache java logstash mongo node perl python redis swarm ubuntu-upstart)

imagelist=(redis percona haproxy jruby hipache glassfish php-zendserver php maven websphere-liberty ubuntu ubuntu-upstart ubuntu-debootstrap mono alpine opensuse rabbitmq postgres mongo mariadb jenkins aerospike thrift swarm oraclelinux mysql mageia fedora crux cirros centos busybox gcc hello-world)

echo "images which share common layers with registry 2.0.1"

for imagename in ${imagelist[*]};
do
	var=`docker history -q kiwenlau/$imagename:latest | grep $bottomid`
        if [ "$var" == $bottomid ]
        then
		echo -e "kiwenlau/$imagename:latest\n"
        fi
done


# get the bottom layer id of kiwenlau/registry:0.9.1
docker history -q kiwenlau/registry:0.9.1 >> temp.txt
bottomid=`tail -1 temp.txt`
rm temp.txt


echo "images which share common layers with registry 0.9.1"

for imagename in ${imagelist[*]};
do
        var=`docker history -q kiwenlau/$imagename:latest | grep $bottomid`
        if [ "$var" == $bottomid ]
        then
                echo -e "kiwenlau/$imagename:latest\n"
        fi
done


