## Authorization Mechanisms

| Node | ABAC | RBAC | Webhook|
|-|-|-|-|

## AlwaysAllow    AlwaysDeny


Node - Kube API - kubelet

ABAC - dev-user -> can create, view , delete pods
	```
```
{kind: "Policy","spec":{"user":"dev-user","namespace":"*",resource":"pods","apiGroup": "*"}}
```
	every changes you must configure in that file

RBAC - dev-user -> ROLE FOR DEVELOPERS   (DEVELOPERS ROLE - VIEW , CREATE , DELETE PODS)

1. Webhook - Kube API **(user dev-user requested read access  to Pods. Should I allow? )** -> Open Policy Agent 
2.           Kube API <-  **( I checked. Yes )** Open Policy Agent 
```
ExecStart=/usr/local/bin/kube-apiserver \\
	--authorization-mode=AllwaysAllow \\
```


```
ExecStart=/usr/local/bin/kube-apiserver \\
	--authorization-mode=Node,RBAC,Webhook
```
User - > NODE  RBAC    WEBHOOK
User  < - NODE

User - > NODE -> RBAC    WEBHOOK
User   < - - - - RBAC

User - > NODE -> RBAC -> WEBHOOK
User   < - - - - - - - - WEBHOOK


The node authorizer handles only node requests. So, it denies the request. Whenever a module denies a request, it is forwarded to the next one in the chain. The role-based access control module performs its checks and grants the user permission. Authorization is complete

