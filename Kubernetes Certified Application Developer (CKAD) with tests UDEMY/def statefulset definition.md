## STATEFUL DEFINITION
#STATEFUL #STATEFULDEFINITION
[[125 (opt for exam) Stateful Sets Introduction]]
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
	podManagementPoicy: Parallel # optional
```         