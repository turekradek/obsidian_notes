> kubectl crate serviceaccount dashboard-sa

serviceaccount "dashboard-sa" created

after make account system create token too

as secret object 

>kubectl describe serviceaccount dashboard-sa

```
name:
namespace:
labels
Tokens: dashboard-sa-token-knbdm -> link to secret
```

>kubectl describe secret dashboard-sa-token-kbbdm 

```
Name:
Namespace:
Labels:
Type:

Data:
===
ca.crt:  
namespace:
token:
qq30g8q03h8mcq38g=mq3508g
```

curl ..... token

>kubectl exec iit my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount

ca.crt namespace token

>kubectl exec iit my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount/token

aodfignaeoibnaoteb

```
apiVersion: v1
kind: Pod
metadata:
	name: my-kubernetes-dachboard
spec:
	contaners:
		- name: my-kubernetes-dashboard
		  image: my-kubernetes-dashboard
	serviceAccountName: dashboard-sa
```

#security #pod #serviceaccount

> kubectl create serviceaccount dashboard-sa

> kubectl create token dashboard-sa

kubectl describe serviceaccout dashboard-sa

kubectl describe sa dashboard-sa

kubectl describe secret NAME_OF_TOKEN

