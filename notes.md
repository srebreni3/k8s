## Must know!!!



**kubectl** - use for managing containers in the node, we can use it locally and in prod
**minikube** - use the managing VM itself, and it can be used only locally
**docker dekstop** - use the managing VM itself

Any time that we want to update existing object, we should find configuration file, leave the **name** and **kind** the same and we can make any other change inside that file.

## objects types

**Pod** - the smallest and simplest Kubernetes object. It runs one or more closely related containers. Pod is only **used for dev environment**.
**Service** - Sets up networking in a Kubernetes Cluster
**Deployment** - a controller that provides declarative updates for Pods and ReplicaSets. It maintains a set of identical pods, ensuring that they have the correct config and that the right number exists. **Good for dev and prod**. 


