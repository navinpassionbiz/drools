#! /bin/bash

. ./Cluster.properties

ibmcloud login -a $CLOUD_URL -u ${CLOUD_USER} -p ${CLOUD_PASSWORD} -r ${CLOUD_REGION} -c ${CLOUD_ACCOUNT}

export KUBECONFIG=`ibmcloud cs cluster-config ${CLUSTERNAME} | grep export |awk '{print $0}'| cut -d '=' -f2`

kubectl cluster-info

kubectl get nodes

ibmcloud cr login

namespace=`ibmcloud cr namespaces | grep ${NAMESPACE} | awk '{print $0}'`

if [[ -z "$namespace" ]]; then
	ibmcloud cr namespace-add $NAMESPACE
fi


#docker build . -t ${REGISTRY}/${NAMESPACE}/${PROJECT}:${VERSION}
./build.sh ${REGISTRY}/${NAMESPACE}/${PROJECT}:${VERSION} .

docker push ${REGISTRY}/${NAMESPACE}/${PROJECT}:${VERSION}

kubectl create -f ${YAMLFILE}

kubectl get deployments
kubectl get service
kubectl get pods
ibmcloud cs workers ${CLUSTERNAME}
#kubectl exec -i -t `kubectl get pods | grep sampleweb | awk '{print $1}'` /bin/bash
#kubectl create service nodeport sampleweb --tcp=80:9080
#kubectl delete deployment sampleweb
#kubectl delete service sampleweb
