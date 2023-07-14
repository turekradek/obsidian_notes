[[143 Cluster Roles]]
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

