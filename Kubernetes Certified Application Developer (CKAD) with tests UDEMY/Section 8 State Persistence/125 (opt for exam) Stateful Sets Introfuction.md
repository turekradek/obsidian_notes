#DEPLOYMENT #DEPLOYMENTDEFINITION
```deployment
 apiVersion: v1                                                     
 kind: Deployment                                            
 metadata:                                                       
	name: myapp-deployment                                          
	labels:                                                          
		app: myapp                                            
		type: front-end                                           
spec:                                                                    
	template:                                                          
	metadata:                                                                                      
		name: myapp-pod                                                                              
	    labels:                                                       
			app: myapp                                                  
            type: front-end                                              
	spec:                                                           
		containers:                                                     
	    - name: nginx-container                                
	      image: nginx
	replicas: 3
	selector:
		matchLabels
			app: mysql   
```                   

#STATEFUL #STATEFULDEFINITION 
[[def statefulset definition]]

```statefulset_definition_yaml
 apiVersion: v1                                                     
 kind: StatefulSet                                       
 metadata:                                                       
	name: myapp-deployment                                          
	labels:                                                          
		app: myapp                                            
		type: front-end                                           
spec:                                                                    
	template:                                                          
	metadata:                                                                                      
		name: myapp-pod                                                                              
	    labels:                                                       
			app: myapp                                                  
            type: front-end                                              
	spec:                                                           
		containers:                                                     
	    - name: nginx-container                                
	      image: nginx
	replicas: 3
	selector:
		matchLabels
			app: mysql   
	serviceName: mysql-h
	podManagementPoicy: Parallel
```                

> kubectl create -f statefulset-definition.yml

> kubectl scale statefulset mysql --replicas=5

> kubectl scale statefulset mysql --replicas=3


##  1. Ordered , graceful deployment
## 2. Stable, unique network identifier

