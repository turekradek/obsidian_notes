[[network_policies_labs.png]]

![[network_policies_labs.png]]

```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: internal-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      name: internal
  policyTypes:
  - Egress
  - Ingress
  ingress:
    - {}
  egress:
  - to:
    - podSelector:
        matchLabels:
          name: mysql
    ports:
    - protocol: TCP
      port: 3306

  - to:
    - podSelector:
        matchLabels:
          name: payroll
    ports:
    - protocol: TCP
      port: 8080

  - ports:
    - port: 53
      protocol: UDP
    - port: 53
      protocol: TCP
```



****Note:** We have also allowed `Egress` traffic to `TCP` and `UDP` port. This has been added to ensure that the internal DNS resolution works from the `internal` pod.

  

**Remember:** The `kube-dns` service is exposed on port `53`:
```
root@controlplane:~> kubectl get svc -n kube-system 
NAME      TYPE        CLUSTER-IP    EXTERNAL-IP    PORT(S)                   AGE 
kube-dns  ClusterIP   10.96.0.10    <none>         53/UDP,53/TCP,9153/TCP    18m 

root@controlplane:~>
```
> k get pods

> k get service

> kubectl get networkpoliciess

> kubectl get netpol

4. What type of raffic is this network Policy configured to handle?
> k describe netpol payroll-policy

Allowing ingress traffic

5. What is the impact of the rule configured on this Network Policy?
10. Create a network policy to allow traffic from internal application only to payroll-service and db-service
## kubernetes documentation

3. Which pod is the Network Policy applied on?
> kubectl get pod --show-labels | grep name=payroll


 