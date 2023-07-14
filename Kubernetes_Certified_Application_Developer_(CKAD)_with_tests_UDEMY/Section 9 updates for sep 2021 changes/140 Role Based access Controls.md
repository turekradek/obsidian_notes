|DEVELOPER GROUP| |
|-| -  |
|Can view PODs| |
|Can create PODs| |
|Can Delete PODs| |
|Can Create ConfigMaps| |

```developer-role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
	name: developer
rules:
- apiGrous: [""]
  resources: ["pods"]
  verbs: ["list","get","create","update","delete"]
- apiGrous: [""]
  resources: ["ConfigMaps"]
  verbs: [create"]
```

> kubectl create -f developer-role.yaml

- [ ] next step link user to group 

```devuser-developer-binding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
	name: devuser-developer-binding
subjects:
- kind: User
  name: dev-user
  apiGroup: rbac.authorization;k8s.io
roleRef:
	kind: Role
	name: developer
	apiGroup: rbac.authorization;k8s.io
```


> kubectl create -f devuser-developer-binding.yaml

> kubectl get roles

> kubectl get romebindings

> kubectl describe role developer

> kubectl describe rolebinding devyser-developer-binding


# Check Access

> kubectl auth can-i crete deployments

> kubectl auth can-i delete nodes

> kubectl auth can-i create  deployments --as dev-user 

> kubectl auth can-i create pods --as dev-user 

> kubectl auth can-i create pods --as dev-user  --namespace test 


POD 1  ( POD orange  POD green )  
POD 4   POD 5

```developer-role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
	name: developer
rules:
- apiGrous: [""]
  resources: ["pods"]
  verbs: ["list","get","create","update","delete"]
  resourceNames: ["orange","green"]

```
