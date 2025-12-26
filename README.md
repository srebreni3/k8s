# KUBERNETES

## CLI

```bash
kubectl apply -f <name of the file>
```
This command applies the configuration specified in the file to the Kubernetes cluster.

```bash
kubectl apply -f <name of the folder>
```
This command applies all the configuration files in the specified folder to the Kubernetes cluster.

```bash
kubectl get pods
```
This command lists all the pods in the current namespace.

```bash
kubectl get services
```
This command lists all the services in the current namespace.

```bash
kubectl describe <object type> <object name> 
kubectl describe pod client-pod
```
This command provides detailed information about a specific Kubernetes object, such as a pod or service.

```bash
kubectl delete -f <name of the file>
```
This command deletes the resources defined in the specified file from the Kubernetes cluster.

```bash
kubectl set image <object_type>/<object_name> <container_name>=<new image> 

# example below:

kubectl set image deployment/client-deployment client=srebreni3/multi-client:v1
```
This command updates the image of a container in a specified Kubernetes object, such as a deployment. But first, you need to update docker image to use new version.

```bash
kubectl logs <pod_name>
```
This command retrieves the logs from a specified pod.

```bash
kubectl get storageclass
```
This command lists all the storage classes available in the Kubernetes cluster.

```bash
kubectl create secret generic <secret_name> --from-literal key=value

# example below:

kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
```
This command creates a generic secret in Kubernetes from a literal value.

```bash
kubectl get service
#and after that
kubectl port-forward service/<service_name> <local_port>:<pod_port>
# example below
kubectl port-forward service/client-cluster-ip-service 3000:3000
```
This command forwards a local port to a port on a service in the Kubernetes cluster, allowing access to the service from the localhost.

## Vulumes in Kubernetes

Volumes in Kubernetes are used to provide persistent storage to containers running in pods. They allow data to persist beyond the lifecycle of a pod, enabling stateful applications to function correctly. We are using **Persistent Volume** and **Persistent Volume Claim**.




