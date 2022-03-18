kubectl version 
#check kubernetes version

kubectl cluster-info 
#view cluster information

kubectl get all 
#retrieve information about kubernetes pods deployments services and more

kubectl run [container-name] --image=[image-name]
#simple way to create deployment for a pod 
#skontrolujkubectl get all 
 
kubectl port-forward [pod] [ports] 
#forward port to allow external access

kubectl expose … 
#expose port for a deployment/pod

kubectl create [resource] 
#create resource

kubectl apply [resource] 
#create or modify resource



#koniec prvej lekcie




kubectl run [podname] --image=nginx:alpine
# Run the nginx:alpine container in a Pod

kubectl get pods
# List only Pods

kubectl get all
# List all resources

kubectl port-forward [name-of-pod] 8080:80
# Enable Pod container to be called externally

kubectl delete pod [name-of-pod]
# Will cause pod to be recreated

kubectl delete deployment [name-of-deployment]
# Delete Deployment that manages the Pod

#Health of the container is chcecked by kubelet via probes
#there are 2 types of probes - liveness and readyness probe
#there are 3 probe types - ExecAction, TCPSocketAction, HTTPGetAction
#there are 3 types of probes result - success, failure, unknown 


#Services
#there are 4 kind of services 
#ClusterIp - expose service on internal cluster ip (default) - pod to pod talking inside cluster
#NodePort - expose service on each node's IP at a static port - allow external calls to service
#Loadbalancer - Provision an external IP to act as a loadbalancer for the service - servicea ahead of cluster
#ExternalName - maps a service to a DNS name - callling external urls from a service


#Storage options
#Volumes 
#   - emptyDir - used for sharing data between two containers inside one pod (goes down with pod)
#   - hostPath - mounsts into node filesystem - goes down with node
#   - NFS - network file system
#   - configMap/secret
#   - persistentVolumeClaim  - provides pod with more persistent storage option that is abstracted from details 
#   - cloud - cluster wide storage
#PersistentVolumes
#PersistentVolumesClaims
#StoreageClasses


#ConfigMaps - provides way to inject configuration data to container









#-------------------------Managing deployments----------------------

# there are X types of deployments 
# - Rolling update
# - Cannary deployments
# - Blue-Greeen deployments

# Rolling update deployments

kubectl create –f file.deployment.yml --save-config --record
#or
kubectl apply -f file.deployment.yml --record 
#rollut update and save it in deployment history (in order to be able rollback to it)

kubectl rollout status deployment [deployment-name]
kubectl rollout status –f file.deployment.yml
#check status of rollout 

kubectl rollout history deployment [deployment-name]
#show rollout history 

kubectl rollout undo –f file.deployment.yml
#rollback deployment

kubectl rollout undo deployment [deployment-name] --to-revision=2
#rollback deployment to specific revision

