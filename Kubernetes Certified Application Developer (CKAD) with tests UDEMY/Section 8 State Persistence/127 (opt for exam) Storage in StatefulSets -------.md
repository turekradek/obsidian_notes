
|pv_definition_yaml | pvc_definition_yaml | pod_definition_yaml|
|-|-|-|
| [[def persistent volume]]| [[def persistent volume claim]] | [[def pod.yaml]] |

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
	replicas: 3
	selector:
		matchLabels:
			app: mysql
	template:                                                          
		metadata:                                                                                                                                                                  
		    labels:                                                       
				app: mysql                                                                                              
	spec:                                                           
		containers:                                                     
	    - name: mysql                                
	      image: mysql
		  volumeMounts:
	      - mountPath: var/lib/mysql
	        name: data-volume
	    volumes:
		    - name: data-volume
		      persistentVolumeClaims:
			      claimName: data-volume
			
```         