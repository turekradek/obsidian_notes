[[113 Developing network policies]]

apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
	name: db-policy
	namespace: prod
spec
	__<span style="color:green">PodSelector</span>
   ___<span style="color:green"> __        matchLabels:</span>
	   <span style="color:green">   ______    role: db</span> # DB Pod
	**policyTypes:
	   - Ingress # WCHODZACE
	ingress:
	- from: 
	   -   podSelector: 
			matchLabels: 
				name: api-pod 
		   ####################
           namespaceSelector:           # DEFAULT NAMESPACE IS prod
	           matchLabels:              # BUT THIS CODE ALLOWD FOR staging TOO
		           name: staging         # BUT ONLY FOR API Pod
		   #####################
		- ipBlock:                      BACKUP
			 cicdr: 192.168.5.10/32      SERVER OUTSIDE CLUSTER 
		  #######################
			ports: 
		    -   protocol: TCP 
			    port: 3306   
