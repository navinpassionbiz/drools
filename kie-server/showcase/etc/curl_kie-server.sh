#!/usr/bin/env bash

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "creating hello container $DATE"
sleep 60
echo "executing curl command $DATE"
#tail -f ../standalone/log/server.log | grep -m 1 'WildFly Full 14.0.1.Final (WildFly Core 6.0.2.Final) started'
curl http://localhost:8080/kie-server/services/rest/server
curl -X PUT -H 'Content-type:application/xml' -u 'kieserver:kieserver1!' --data @createHelloContainer.xml http://localhost:8080/kie-server/services/rest/server/containers/hello
sleep 30

