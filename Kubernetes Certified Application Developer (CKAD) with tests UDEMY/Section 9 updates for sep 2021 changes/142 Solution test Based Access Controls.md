1. Inspect the environment and identity the authorization modes configured on the cluster
	1. cat /etc/kubernetes/manifests/kube-apiserver.yaml
	2. ps -aux | grep authorization
> kubectl create rolebinding --help

> kubectl create rolebinding dev-user-binding --role=developer --user=dev-user

10. The dev-user is trying to get details about the dark-blue-app pod in the blue namespace.
> k --as dev-user get pod dark-blue-app -blue 

11. Grant the dev-user permissions to creative deployments in the blue namespace 
> kubectl --as dev-user create deployment nginx --image=nginx

