## DEPLOYMENT DEFINITION
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