| | | |curl https://kube-master:6443/version   | curl https://kube-master:6443/api/v1/pods | | |
|-|-|-|-|-|-|
|/metrics | /healthz |/version |  /api | /apis |/logs|
|-|-|-|-|-|-|


| | core | |
|-|-|-|
| | /v1 | |
| namespaces |  pods | rc |
| events| endpoints |  nodes|
| bindings| PV| PVC |
| configmaps| secrets| services |
| | | |

[[api_groups.jpg]]


![[api_groups.jpg]]


curl http://localhost:6443 -k

{
	"paths":[
		"/api",
		"/api/v1",
		"/apis",
		"/apis/",
		"/healthz",
		"/logs",
		"/metrics",
		"/openapi/v2",
		"/swagger-2.0.0.json",
	]
}

curl http://localhost:6443 -k | grep "name"

"name": "extensions",
"name": "apps",
"name": "events.k8s.io",
"name": "batch",
"name": "policy",
"name": "networking.k8s.io",
"name": "storage",
"name": "certificates.k8s.io,

> kubectl proxy   # set proxy to Kube ApiServer 

starting to serve 127.0.0.1:8001









