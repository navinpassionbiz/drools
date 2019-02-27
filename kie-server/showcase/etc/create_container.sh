#!/usr/bin/env bash
exec > >(tee -i kieserver.log)
exec 2>&1
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "creating hello container $DATE"
sleep 120
echo "executing curl command $DATE"
#tail -f ../standalone/log/server.log | grep -m 1 'WildFly Full 14.0.1.Final (WildFly Core 6.0.2.Final) started' 
curl -u 'kieserver:kieserver1!' http://localhost:8080/kie-server/services/rest/server
curl -X PUT -H 'Content-type:application/xml' -u 'kieserver:kieserver1!' --data @createHelloContainer.xml http://localhost:8080/kie-server/services/rest/server/containers/hello

