
k create configmap nginx-configuration -n ingress-space configmap/nginx-configuration created

## 5 
We have created the Roles and RoleBindings for the SerciseAccount check it out
> k get roles -n ingress-space

> k get rolebindings -n ingress-space

> k describe role ingress-role -n ingress-space


## 6

Let us now deploy the Ingress Controller. Create a deployment using the file given.

The Deployment configuration is given at `/root/ingress-controller.yaml`. There are several issues with it. Try to fix them.

CheckCompleteIncomplete

-   Deployed in the correct namespace.
    
-   Replicas: 1
    
-   Use the right image
    
-   Namespace: ingress-space

```
--- 
apiVersion: apps/v1 
kind: Deployment 
metadata: 
	name: ingress-controller 
	namespace: ingress-space 
spec: 
	replicas: 1 
	selector: 
		matchLabels: 
			name: nginx-ingress 
	template: 
		metadata: 
			labels: 
				name: nginx-ingress 
	spec: 
		serviceAccountName: ingress-serviceaccount 
		containers: 
			- name: nginx-ingress-controller 
			  image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.21.0 
			  args: 
				- /nginx-ingress-controller 
				- --configmap=$(POD_NAMESPACE)/nginx-configuration 
				- --default-backend-service=app-space/default-http-backend 
			  env: 
				- name: POD_NAME 
				  valueFrom: 
					  fieldRef: 
						  fieldPath: metadata.name 
				- name: POD_NAMESPACE 
				  valueFrom: 
					  fieldRef: 
					  fieldPath: metadata.namespace 
			  ports: 
				- name: http 
				  containerPort: 80 # NO SPACES 
				- name: https 
				  containerPort: 443 # NO SPACES
```

# solution 6


## 7
Let us now create a service to make Ingress available to external users.

Create a service following the given specs.

-   Name: ingress
    
-   Type: NodePort
    
-   Port: 80
    
-   TargetPort: 80
    
-   NodePort: 30080
    
-   Namespace: ingress-space
    
-   Use the right selector

Use the command `kubectl expose -n ingress-space deployment ingress-controller --type=NodePort --port=80 --name=ingress --dry-run=client -o yaml > ingress.yaml` and manually add the given `node port` and `namespace`.

```
--- apiVersion: v1 kind: Service metadata: name: ingress namespace: ingress-space spec: type: NodePort ports: - port: 80 targetPort: 80 protocol: TCP nodePort: 30080 name: http - port: 443 targetPort: 443 protocol: TCP name: https selector: name: nginx-ingress
```

> kubectl get deploy -n ingress-space

> kubectl expose deploy ingress-controller -n ingress-space --name ingress --port=80 --target-port=80 --type NodePort

take nodeport
> k get svc -n ingress-space

> k edit svc ingress -n ingress-space

write node port 

> kubectl create ingress ingress-wear-wtch-n app-space --rule="/wear=wear-service:8080" --rule="/watch=vide-service:8080"

to check role -> k get svc -n app-space
> k logs name of od -n app-space 

## 8
Create the ingress resource to make the applications available at `/wear` and `/watch` on the Ingress service.

Create the ingress in the `app-space` namespace.

CheckCompleteIncomplete

-   Ingress Created
    
-   Path: /wear
    
-   Path: /watch
    
-   Configure correct backend service for /wear
    
-   Configure correct backend service for /watch
    
-   Configure correct backend port for /wear service
    
-   Configure correct backend port for /watch service

```
apiVersion: networking.k8s.io/v1 
kind: Ingress 
metadata: 
	name: ingress-wear-watch 
	namespace: app-space 
	annotations: 
		nginx.ingress.kubernetes.io/rewrite-target: / 
		nginx.ingress.kubernetes.io/ssl-redirect: "false" 
spec: 
	rules: 
		- http: 
			paths: 
			path: /wear 
			pathType: Prefix 
			backend: 
				service: 
					name: wear-service 
					port: 
						number: 8080 
		- http:
			path: /watch
			pathType: Prefix 
			backend: 
				service: 
					name: video-service 
					port: 
						number: 8080

```
> k create ingress test-ingress --namespace=app-space --rule="/wear=wear-service:80" --rule="/watch=wath-service:80" --dry-run=client -o yaml > new.yaml