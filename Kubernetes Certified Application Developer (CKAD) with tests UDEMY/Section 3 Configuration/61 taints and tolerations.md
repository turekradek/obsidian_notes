
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
