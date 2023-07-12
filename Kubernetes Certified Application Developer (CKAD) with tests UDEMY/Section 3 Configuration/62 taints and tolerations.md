
[[def pod.yaml]] 
#pod 

```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	ports:
		- containerPort: 8080
	resources:
		requests:
			memory: "1Gi"
			cpu: 1
```

# taints - Node
# toleration - pod 

>kubectl taint nodes node-name key=value:taint-effect 

taint-effect -> what happends to PODs that DO NOT TOLERATE this taint

| NoSchedule | PreferNoSchedule | NoExecute|
|-|-|-|
| no schedule | will try no scheduler but is no guarentied | will not be scheduled on the node and existing pods on the node, if any, will be evicted if they do not tolerate the taint.|

	kubectl taint nodes node app=blue:NoSchedule


## tolerations - PODs

kubectl taint nodes node1 <span style=color:red>app</span><span style=color:yellow
	  >=</span><span style=color:blue>blue</span>:<span style=color:green>NoSchedule</span>


apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	tolerations:
	- key: <span style=color:red>"app"</span>
	  operator: <span style=color:yellow
	  >"Equal"</span>
	  value: <span style=color:blue>"blue"</span>
	  effect: <span style=color:green>"NoSchedule"</span>

### So remember, taints and tolerations does not tell the pod to go to a particular node. Instead, it tells the node to only accept pods with certain tolerations.

#taints #toleration

If your requirement is to restrict a pod to certain nodes,

it is achieved through another concept

called as node affinity, 

kubect describe node kubemaster | grep Taint
taints:   node-role.kubernetes.iomaster:NoSchedule

# to remove taint

> kubectl taint node controlplane node-role.kubernetes.io/master:NoSchedule- 

tan myślnik robi robotę 


#exercise
### Create a pod that will be deployed to a Node that has the label 'accelerator=nvidia-tesla-p100'

show

Add the label to a node:

```shell
kubectl label nodes <your-node-name> accelerator=nvidia-tesla-p100
kubectl get nodes --show-labels
```

We can use the 'nodeSelector' property on the Pod YAML:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: cuda-test
spec:
  containers:
    - name: cuda-test
      image: "k8s.gcr.io/cuda-vector-add:v0.1"
  nodeSelector: # add this
    accelerator: nvidia-tesla-p100 # the selection label
```

You can easily find out where in the YAML it should be placed by:

```shell
kubectl explain po.spec
```

OR: Use node affinity ([https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes-using-node-affinity/#schedule-a-pod-using-required-node-affinity](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes-using-node-affinity/#schedule-a-pod-using-required-node-affinity))

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: affinity-pod
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: accelerator
            operator: In
            values:
            - nvidia-tesla-p100
  containers:
    ...
```

### [](https://github.com/dgkanatsios/CKAD-exercises/blob/main/c.pod_design.md#taint-a-node-with-key-tier-and-value-frontend-with-effect-noshedule-then-create-a-pod-that-tolerates-this-taint)Barwy a node with key `tier` and value `frontend` with effect `NoShedule`. Then, create a pod that tolerates this taint.

show

Taint a node:

```shell
kubectl taint node node1 tier=frontend:NoSchedule # key=value:Effect
kubectl describe node node1 # view the taints on a node
```

And to tolerate the taint:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: frontend
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "tier"
    operator: "Equal"
    value: "frontend"
    effect: "NoSchedule"
```

### [](https://github.com/dgkanatsios/CKAD-exercises/blob/main/c.pod_design.md#create-a-pod-that-will-be-placed-on-node-controlplane-use-nodeselector-and-tolerations)Create a pod that will be placed on node `controlplane`. Use nodeSelector and tolerations.

show

```shell
vi pod.yaml
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: frontend
spec:
  image:
    name: nginx
    image: nginx
  nodeSelector:
    kubernetes.io/hostname: controlplane
  tolerations:
  - key: "node-role.kubernetes.io/control-plane"
    operator: "Exists"
    effect: "NoSchedule"
```

```shell
kubectl create -f pod.yaml
```
