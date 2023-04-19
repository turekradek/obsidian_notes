[[def pod.yaml]]

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
	nodeSelector:
		size: Large
```
Large coms from labels of node 

kubectl label nodes <node-name> <label-key>=<label-value>
kubectl label nodes node-1 size=Large 

Node selector - minitations

- [ ] Large OR Medium 
- [x] NOT Small
- [ ] 