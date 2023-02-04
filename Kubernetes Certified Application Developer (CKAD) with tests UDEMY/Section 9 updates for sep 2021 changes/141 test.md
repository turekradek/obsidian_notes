
kind: Role apiVersion: rbac.authorization.k8s.io/v1 metadata: namespace: default name: developer rules: - apiGroups: [""] resources: ["pods"] verbs: ["list", "create","delete"] --- kind: RoleBinding apiVersion: rbac.authorization.k8s.io/v1 metadata: name: dev-user-binding subjects: - kind: User name: dev-user apiGroup: rbac.authorization.k8s.io roleRef: kind: Role name: developer apiGroup: rbac.authorization.k8s.io


A set of new roles and role-bindings are created in the `blue` namespace for the `dev-user`. However, the `dev-user` is unable to get details of the `dark-blue-app` pod in the `blue` namespace. Investigate and fix the issue.

We have created the required roles and rolebindings, but something seems to be wrong.