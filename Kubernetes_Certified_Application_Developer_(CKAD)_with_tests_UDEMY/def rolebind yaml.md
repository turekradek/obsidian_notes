
[[143 Cluster Roles]]

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