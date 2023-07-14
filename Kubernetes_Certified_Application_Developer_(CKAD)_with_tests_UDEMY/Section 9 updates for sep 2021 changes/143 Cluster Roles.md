> kubectl api-resources --namespaced=true

> kubectl api-resources --namespaced=false

> kubectl create -f cluster-admin-role-binding.yaml

```cluster-adimn-role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: CLusterRole
metadata:
	name: cluster-administrator
rules:
- apiGrous: [""]
  resources: ["nodes"]
  verbs: ["list","get","create","delete"]

```

> kubectl create -f developer-role.yaml

- [ ] next step link user to group 

```cluster-admini-role-binding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
	name: cluster-admin-role-binding
subjects:
- kind: User
  name: cluster-admin
  apiGroup: rbac.authorization;k8s.io
roleRef:
	kind: ClusterRole
	name: cluster-administrator
	apiGroup: rbac.authorization;k8s.io
```