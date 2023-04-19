

Ingress & Egress

1.  Ingress 80 <-- Website
    
2.  Egress 5000 --> Website
    
3.  Ingress 5000 <-- API
    
4.  Egress 3306 --> API
    
5.  Ingress 3306 <-- DBase
    

## 

Network Security

Network Policy


<span style="color:green">PodSelector</span>
   <span style="color:green">         matchLabels:</span>
	   <span style="color:green">       role: db</span>


DBPod

```
labels:
    role: db
```

---
<span style="color:green">PodSelector</span>
   <span style="color:green">         matchLabels:</span>
	   <span style="color:green">       role: db</span>
	   
 **policyTypes:
   -Ingress 
   ingress: 
  from: 
    -   podSelector: 
			matchLabels: 
				name: api-pod 
	ports: 
    -   protocol: TCP 
	    port: 3306


apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
	name: db-policy
spec
	__<span style="color:green">PodSelector</span>
   ___<span style="color:green"> __        matchLabels:</span>
	   <span style="color:green">   ______    role: db</span>
	**policyTypes:
	   -Ingress 
	   ingress: 
		-  from: 
		    -   podSelector: 
					matchLabels: 
						name: api-pod 
			ports: 
		    -   protocol: TCP 
			    port: 3306   

> kubectl create -f policy-definition.yaml

| <span style="color:green">Solutions tha Support Network Policies:</span> | <span style="color:red">Colutions that DO NOT Support NEtwork Policies:</span>|
|-|-|
| Kube-router| Flanel|
|Calico||
|Romana||
|Weave-net||
