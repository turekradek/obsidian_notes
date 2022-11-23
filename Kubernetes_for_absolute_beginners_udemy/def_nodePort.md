```NodePort
        apiVerion: v1
        kind: Service
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