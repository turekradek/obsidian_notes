
## Security KUBECONFIG

#kubeconfig

> curl [https://my-kube-playground:6443/api/v1/pods](https://my-kube-playground:6443/api/v1/pods)  
> --key admini.hey --cert admin.crt --cacert ca.crt

```
{
	"kind": "PodList",
	"apiVersion": "v1",
	"metadata": {
		selfLink":"/api/v1/pods",
	},
	"items": []
}
```

> kubectl get pods --server my-kube-playground:6443 --client-key admin.key --client-cortificate admin.crt --certificate-authority ca.crt

## [](https://github.com/turekradek/obsidian_notes/blob/kubernetes_28_ikea/Kubernetes%20Certified%20Application%20Developer%20(CKAD)%20with%20tests%20UDEMY/Section%209%20updates%20for%20sep%202021%20changes/135%20Kube%20Config.md#homekubeconfig)$HOME/.kube/config

```
--server my-kube-playground:6443
--client-key admin.key
--client-cortificate admin.crt
--certificate-authority ca.crt
```

| | KUBECONFGFILE | 
|-| - |-| 
| Clusters | Contexts |Users| 
| Development |**Admin@Production** | **Admin**| 
|**Production** |Dev@Google | Dev User| 
| Google||Prod User|
| MyKubePlayground | | MyKubeAdmin|
| --server my-kube-playground:6443| | --client-key admin.key|
| | | --client-certificate admin.crt|
| | |--certificate-authority ca.crt |


[[def kubeconfig file]]

> kubectl config view
```kubeconfigfile.yaml
apiVersion: v1
kind: Config


clusters:
- name: my-kube-playgroud
  cluster: 
	  certificate-authority: # /etc/kubernetes/pkl/ca.crt
	  server: https://my-kube-playground:6443


contexts:
- name: my-kube-admin@my-kube-playground
  context:
	  cluster: my-kube-playgroud # clusteran me
	  user: my-kube-admin # user name 
	  namespace: finance # CAN BE USE FOR SPEC

users:
- name: my-kube-admin
  user:
	  client-certificate: admin.crt
	  client-key: admin.key

```

> cat ca.crt | base64
apiVersion: v1
kind: Config

clusters:
- name: my-kube-playgroud
  cluster: 
	  certificate-authority-data: cat ca.crt | base64
	  
	
> kubectl config view --kubeconfig=my-custom-config
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

> kubectl config use-context prod-user@production

kubectl config -h 



