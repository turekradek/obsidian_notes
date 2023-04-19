[[135 KubeConfig]]

```kubeconfigfile.yaml
apiVersion: v1
kind: Config


clusters:
- name: my-kube-playgroud
  cluster: 
	  certificate-authority:
	  server: https://my-kube-playground:6443





contexts:
- name: my-kube-admin@my-kube-playground
  context:
	  cluster: my-kube-playgroud # clusteran me
	  user: my-kube-admin # user name 




users:
- name: my-kube-admin
  user:
	  client-certificate: admin.crt
	  client-key: admin.key




```

```kubeconfigfile.yaml
apiVersion: v1
kind: Config

current-context: dev-user@google

clusters:
- name: my-kube-playgroud
- name: development
- name: production
- google


contexts:
- name: my-kube-admin@my-kube-playground
- name: dev-user@google
- name: prod-user@production


users:
- name: my-kube-admin
- name: admin
- name: dev-user
- name: prod-user




```