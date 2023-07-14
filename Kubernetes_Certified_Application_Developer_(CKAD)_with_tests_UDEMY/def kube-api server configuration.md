```/etc/kubernetes/manifest/kube-apiserver.yaml
apiVersion: v1
kind: Pod
metadata:
	creationTimestamp: null
	name: kube-apiserver
	namespace: kube-system
spec:
  containers:
  - command:
    - kube-apiserver
    - --authorization-mode=Node,RBAC
    - --advertise-addresss==172.17.0.107
    - --allow-privileged=true
    - --enable-admission-plugins=NodeRestriction
    - --enable-bootstrap-token-auth=true


```