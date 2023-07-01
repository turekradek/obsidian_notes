## 2 different types of account

# user account
- [ ] 1 user account **are used by users** 
	 > kubectl create serviceaccount dashboard-sa
	 


# servise account 
- [ ] 2 service account **are useb by sercices** 
	> kubectl create serviceaccount dashboard-sa
	
	- [ ] serviceaccount "dashboard-sa" created

	- [ ] after make account system create token too 	as secret object 

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
__TO SEE IFROMATION ABOUT TOKEN USE COMMAND BELLOW__
__it is inside token__
>kubectl exec iit my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount

**you can see those files** 

ca.crt namespace token

>kubectl exec iit my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount/token

__to use different service account modifiy pod definition file__
- yoo can not modiefiy existing pod , you have to delete and create new pod

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

v1.24 you should generate the token yourself

> kubectl create serviceaccount dashboard-sa

> kubectl create token dashboard-sa

kubectl describe serviceaccout dashboard-sa

kubectl describe sa dashboard-sa

kubectl describe secret NAME_OF_TOKEN
# update serviceaccount dashboard-sa to -> deployment web-dashboard 
> k set serviceaccount deploy/web-dashboard dashboard-sa

