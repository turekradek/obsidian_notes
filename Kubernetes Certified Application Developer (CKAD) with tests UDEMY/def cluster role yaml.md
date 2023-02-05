[[143 Cluster Roles]]
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

