
1. Deploy a pod named `nginx-pod` using the `nginx:alpine` image.

Use imperative commands only.
>kubectl run nginx-pod --image=nginx --dry-run=client -o yaml

> kubectl run nginx-pod --image=nginx:alpine

2. Create a service `redis-service` to expose the `redis` application within the cluster on port `6379`.

Use imperative commands.
> kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
Error from server (NotFound): pods "redis" not found

> kubectl run redis --image=redis

> kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml

```output
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    run: redis
  name: redis-service
spec:
  ports:
  - port: 6379
    protocol: TCP
    targetPort: 6379
  selector:
    run: redis
status:
  loadBalancer: {}
```
>kubectl expose pod redis --port=6379 --name redis-service

3. Create a deployment named `webapp` using the image `kodekloud/webapp-color` with `3` replicas.

Try to use imperative commands only. Do not create definition files

> kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3 --dry-run=client -o yaml

>kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3

6. Create a new pod called `custom-nginx` using the `nginx` image and expose it on `container port 8080`.

>kubectl run custom-nginx --image=nginx --port=8080 --dry-run=client -o yaml

Create a new namespace called `dev-ns`.
>kubectl create namespace dev-ns

Create a new deployment called `redis-deploy` in the `dev-ns` namespace with the `redis` image. It should have `2` replicas.
>kubectl create deployment redis-deploy --image=redis --replicas=2 --namespace=dev-ns --dry-run=client -o yaml

9. Create a pod called `httpd` using the image `httpd:alpine` in the default namespace. Next, create a service of type `ClusterIP` by the same name `(httpd)`. The target port for the service should be `80`.

>kubectl run httpd --image=httpd:apline --dry-run=client -o yaml

>kubectl expose pod httpd --port=80 --name=httpd --type=ClusterIP --dry-run=client -o yaml
