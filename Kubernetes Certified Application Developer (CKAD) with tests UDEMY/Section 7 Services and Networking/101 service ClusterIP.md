## Services - ClusterIP
#SERVICE #CLUSTEIP


| front-end | 10.244.0.3  |10.244.0.2  |10.244.0.4 |
| - | - | - | - |
| |back-end | back-end |
| back-end | 10.244.0.7|10.244.0.5 | 10.244.0.8
| | redis| redis | 
| redis |10.244.0.6|10.244.0.9|10.244.0.10|


```service_def_clusterIP
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: ClusterIP
  ports:
    - targetPort: 80
      port: 80
  selector:
    app: myapp
    type: back-end
```


## Service LoadBalancer
[[kubernetes_service_load_balancer.png]]
![[Kubernetes Certified Application Developer (CKAD) with tests UDEMY/kubernetes_service_load_balancer.png]]
