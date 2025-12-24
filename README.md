# KUBERNETES

## CLI

```bash
kubectl apply -f <name of the file>
```
This command applies the configuration specified in the file to the Kubernetes cluster.

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

example below:

kubectl set image deployment/client-deployment client=srebreni3/multi-client:v1
```
This command updates the image of a container in a specified Kubernetes object, such as a deployment.