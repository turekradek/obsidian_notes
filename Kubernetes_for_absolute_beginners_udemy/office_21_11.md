## after i have beed returned from sweden 

## 34
exercise only

## 36 deplyments update and rollback

> kubectl create -f deplyment.yaml

> kubectl rollout status deplyment.apps/myapp-deplyment 

status successfully rolled out 
history deployment 
> kubectl rollout history deplyment.apps/myapp-deplyment 


Let us try that. Upgrade the application by setting the image on the deployment to kodekloud/webapp-color:v2

Do not delete and re-create the deployment. Only set the new image name for the existing deployment.

>  kubectl edit deployment ..
> kubectl rollout undo deployment....


- [ ] check box 

~~skreslenie~~

**pogrubienie**

---
# Sec_7 Networking in Kubernetes 39

- [ ] ip adres to access to kubernetes cluster 192.168.1.2
- [ ] ip addres sis assigned to a pod  10.244.0.2
- [ ] after created container is created to network 10.244.0.0 
- [ ] after that all pods are created with those addresses 10.244.0.3  4  2 

> multiple nodes

| cluster | ip address | web ip address | pods ip address |
|-------|--|--|---|
|192.168.1.2       | |    |192.169.1.3                    | 
| 10.244.0.0    |         |        |     10.244.0.0       |
|10.244.0.2|10.244.0.3    | 10.244.0.2    | 10.244.0.3    |
|    pod        |  pod    |     pod       |     pod       |


> if the same cluster conflict 10.244.0.0

routing between nodes 

--- 
# sec 8 services node port 
connect aplications together and with users 

laptop 192.168.2.10 > node (192.168.1.2) > node web (10.244.0.0) > pod (10.244.0.2)

- [ ] ssh curl http://10.244.0.2   only inside 
- [ ] kubernetes service laptop > curl http://192.168.1.2:30008 < node 30008 > service > pod and web 
> sevice is like pod object use to connect web and pod 

## services types
- [ ] nodeport         on the wall of node  30008 (30000-32767)> service > 80 (port) > 80 (target port) > pod 


      ```
        apiVerion: v1
        kind: Sevice
        metadata:
            name: myapp-service
        spec:
            type: NodePort
            ports:
              - targetPort: 80   # port on pod
                port: 80         # port on service 
                nodePort: 30008  # on the wall of node 
            **selector: # this part is from pod-definition.yml from labels:
                app: myapp
                type: front-end** 
               
      ```

>pod-definition.yml

> apiVersion: v1
```
 kind: Pod
 metadata:
   name: myapp-pod
   labels:
     app: myapp
     type: front-end
 spec:
   containers:
   - name: nginx-container
     image: ngoinx
```
> kubectl create -f service-definition.yml 
> kubectl get services 


| NAME | TYPE | CLUSTER-IP | EXTERNAL-IP | PORT(S) | AGE|
|----|---|----|----|---|----|
|myapp-service| NodePOrt|  10.106.127.123|  none |  80:30008/TCP | 5m|

> CURL HTTP://192.1.2:30008

|              |      |        USER   |      |     |       |
|-------       |------|------------|---------|---- |-------  |
|CURL HTTP://192.168.1.2:30008 |      | CURL HTTP://192.168.1.2:30008 | |  CURL HTTP://192.168.1.4:30008  | |
|   NODE 1     |      |  NODE 2              |     |    NODE 3         | |
|192.168.1.2   | 30008|192.168.1.3           |30008|    192.168.1.4    |30008 |
|              |      |        SERVICE       |     |                   |  |
|  10.244.0.3  |      |       10.244.0.2     |     |       10.244.0.4  |  |
|   POD 1      |      |        POD 2         |     |         POD  3    |  |





- [ ] clusterip       inside of node
- [ ] loadBalancer  1 point outside the wall of node and 3 points on the wall of node 
- [ ] 







