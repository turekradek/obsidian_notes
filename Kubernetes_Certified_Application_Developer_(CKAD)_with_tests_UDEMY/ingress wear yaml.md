[[105 Ingress Networking]]

```ingress_wear
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: ingress-wear
spec:
	backend:
		serviceName: wear-service
		servicePort: 80
```

> kubectl create -f Ingress-wear.yaml

