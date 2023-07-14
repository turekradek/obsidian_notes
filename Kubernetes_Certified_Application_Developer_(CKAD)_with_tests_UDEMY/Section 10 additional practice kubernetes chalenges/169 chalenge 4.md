```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: redis01
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /redis01
```

```service
apiVersion: v1
kind: Service
metadata:
  name: redis-cluster-service
spec:
  selector:
    app: redis-cluster
  ports:
  - name: client
    port: 6379
    targetPort: 6379
  - name: gossip
    port: 16379
    targetPort: 16379

```

```statefulset
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: redis-cluster
spec:
  replicas: 6
  serviceName: redis-cluster
  selector:
    matchLabels:
      app: redis-cluster
  template:
    metadata:
      labels:
        app: redis-cluster
    spec:
      containers:
      - name: redis
        image: redis:5.0.1-alpine
        command: ["/conf/update-node.sh", "redis-server", "/conf/redis.conf"]
        env:
        - name: POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        ports:
        - name: client
          containerPort: 6379
        - name: gossip
          containerPort: 16379
        volumeMounts:
        - name: conf
          mountPath: /conf
          readOnly: false
        - name: data
          mountPath: /data
          readOnly: false
      volumes:
      - name: conf
        configMap:
          name: redis-cluster-configmap
          defaultMode: 0755
      - name: data
        persistentVolumeClaim:
          claimName: data-claim
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi

```

> kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')
> 