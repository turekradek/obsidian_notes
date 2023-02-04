[[def services.yaml]]

connect aplications together and with users 

laptop 192.168.2.10 > node (192.168.1.2) > node web (10.244.0.0) > pod (10.244.0.2)

- [ ] ssh curl http://10.244.0.2   only inside pod
- [ ] kubernetes service laptop > curl http://192.168.1.2:30008 < node 30008 > service > pod and web 
> sevice is like pod object use to connect web and pod 

## services types
- [ ] nodeport         on the wall of node  30008 (30000-32767)> service > 80 (port) > 80 (target port) > pod 
				 | - - * --|
	            |         |
- [ ] ClusterIP inside
			|-----------|
           |     *     |
           |-----------|
- [ ] LoadBalancer 3 points on the wall 

                         *
                         |
                   |---*--*--*---|
                   |             |
                   |-------------|           

## Service NodePort
[[service_nodeport.png]]
![[service_nodeport.png]]





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

> curl http://192.168.1.2:30008


[[service_nodeport2.png]]
![[service_nodeport2.png]]















![[service_nodeport2.png]]