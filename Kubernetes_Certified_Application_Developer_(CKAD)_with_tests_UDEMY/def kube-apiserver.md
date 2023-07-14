[[133 Authentication, Authorization and admission control]]
--basic-auth-file=user=detail.csv

```kube-apiserver.service
ExecStart=/usr/local/bin/kube-apiserver \\
--advertise-address=${INTERNAL_IP} \\ 
--allow-privileged=true \\
--apiserver-count=3 \\
--authorization-mode=Node,RBAC \\
--bind-address=0.0.0.0 \\
--enable-swagger-ui=true \\
--etcd-servers=https://127.0.0.1:2379 \\
--event-ttl=1h \\
--runtime-config=api/all \\
--service-cluster-ip-range=10.32.0.0/24 \\
--service-node-port-range=30000-32676 \\
--v=2
```