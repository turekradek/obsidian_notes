```service_yml
apiVersion: v1
kind: Sevice
metadata:
	name: myapp-service
spec:
	type: NodePort
	ports:
	  - port: 80
	    targetPort: 80
	    nodePort: 30004
	selector:
		app: myapp
	    
	    
```