```
apiVersion: networking.k8s.io/v1 
kind: Ingress 
metadata: 
	name: test-ingress 
	namespace: critical-space 
	annotations: 
		nginx.ingress.kubernetes.io/rewrite-target: / # this line just add / to the end of url
		nginx.ingress.kubernetes.io/ssl-redirect: "false" 
spec: 
	rules: 
	- http: paths: 
		path: /pay 
		pathType: Prefix 
		backend: 
			service: 
				name: pay-service 
				port: 
					number: 8282
```

> kubectl create ingress test-ingress --namespace=critical-space --rule='/pay=pay-service:8282'
> kubectl create ingress test-ingress -n=critical-space          --rule='/pay=pay-service:8282' --dry-run=client yam