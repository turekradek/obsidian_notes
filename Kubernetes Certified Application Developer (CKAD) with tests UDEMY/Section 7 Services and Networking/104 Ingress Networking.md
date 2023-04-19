- [ ] INGRESS COTROLLER
- [ ] INGRESS RESOURCES

## INGRESS CONTROLLER 
- [ ] GCP HTTP(S) lOAD bALANCER
- [ ] N
- [ ] CONTOUR
- [ ] HAPROXY
- [ ] TRAEFIK
- [ ] ISTIO

[[def ingress controler yaml]]

# INGRESS RESOURCE - RULES

| www.my-online-store.com  | www.wear.my-online-store.com | www.watch.my-online-store.com | www.EVERY-ELSE.com |
|-|-|-|-|
|Rule 1| Rule 2 | Rule 3 | Rule 4 |
| POD | POD | POD | POD|
www.my-online-store.com

apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: ingress-wear-watch
spec:
	rules:
	- http:
		paths:
		- path: /wear
		  **backend:
			serviceName: wear-service
			servicePort: 80**
		- path: /watch 
		  **backend:
			serviceName: watch-service
			servicePort: 80**
ingress
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: nginx-configuration
spec:
	**backend:
		serviceName: wear-service
		servicePort: 80**

---

apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: ingress-wear-watch
spec:
	rules:
	- host: wear.my-online-store.com
	  http:
		paths:
		  **backend:
			serviceName: wear-service
			servicePort: 80**
		
	  - host: watch.my-online-store.com
	    http:
		    paths:
			-  backend:
				serviceName: watch-service
				servicePort: 80

ingress
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: nginx-configuration
spec:
	**backend:
		serviceName: wear-service
		servicePort: 80

[[ingress resource.png]]

![[ingress resource.png]]








> kubectl create ingress ingres-pay -n critical-space --rule="/pay=pay-service:8282"

