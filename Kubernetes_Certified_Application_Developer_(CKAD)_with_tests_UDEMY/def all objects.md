
## POD
https://kubernetes.io/docs/concepts/workloads/pods/

#POD 
[`pods/simple-pod.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/pods/simple-pod.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy pods/simple-pod.yaml to clipboard")

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```

## DEPLOYMETS
https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

#DEPLOYMENT 
## Creating a Deployment[](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment)

The following is an example of a Deployment. It creates a ReplicaSet to bring up three `nginx` Pods:

[`controllers/nginx-deployment.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/controllers/nginx-deployment.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy controllers/nginx-deployment.yaml to clipboard")

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

## REPLICASETS
https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
#replicaset 
[`controllers/frontend.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/controllers/frontend.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy controllers/frontend.yaml to clipboard")

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3
```

## REPLICASETCONTROLLER
https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/
#REPLICATIONCONTROLLER 
[`controllers/replication.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/controllers/replication.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy controllers/replication.yaml to clipboard")

```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

## JOB
https://kubernetes.io/docs/concepts/workloads/controllers/job/
#JOB 
[`controllers/job.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/controllers/job.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy controllers/job.yaml to clipboard")

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: pi
spec:
  template:
    spec:
      containers:
      - name: pi
        image: perl:5.34.0
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy: Never
  backoffLimit: 4
```

## CRONJOB
https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/
#CRONJOB
[`application/job/cronjob.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/job/cronjob.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy application/job/cronjob.yaml to clipboard")

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "* * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox:1.28
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
```

## SERVICE
https://kubernetes.io/docs/concepts/services-networking/service/

#SERVICE 
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app.kubernetes.io/name: proxy
spec:
  containers:
  - name: nginx
    image: nginx:stable
    ports:
      - containerPort: 80
        name: http-web-svc

---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app.kubernetes.io/name: proxy
  ports:
  - name: name-of-service-port
    protocol: TCP
    port: 80
    targetPort: http-web-svc
```

## INGRESS
https://kubernetes.io/docs/concepts/services-networking/ingress/
#INGRESS

[`service/networking/minimal-ingress.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/service/networking/minimal-ingress.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy service/networking/minimal-ingress.yaml to clipboard")

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: minimal-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx-example
  rules:
  - http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: test
            port:
              number: 80
```

### Resource backends[](https://kubernetes.io/docs/concepts/services-networking/ingress/#resource-backend)

A `Resource` backend is an ObjectRef to another Kubernetes resource within the same namespace as the Ingress object. A `Resource` is a mutually exclusive setting with Service, and will fail validation if both are specified. A common usage for a `Resource` backend is to ingress data to an object storage backend with static assets.

[`service/networking/ingress-resource-backend.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/service/networking/ingress-resource-backend.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy service/networking/ingress-resource-backend.yaml to clipboard")

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-resource-backend
spec:
  defaultBackend:
    resource:
      apiGroup: k8s.example.com
      kind: StorageBucket
      name: static-assets
  rules:
    - http:
        paths:
          - path: /icons
            pathType: ImplementationSpecific
            backend:
              resource:
                apiGroup: k8s.example.com
                kind: StorageBucket
                name: icon-assets
```


## NETWORK POLICIES
https://kubernetes.io/docs/concepts/services-networking/network-policies/
#NETWORKPOLIECIES

[`service/networking/networkpolicy.yaml`](https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/service/networking/networkpolicy.yaml) ![](https://d33wubrfki0l68.cloudfront.net/0901162ab78eb4ff2e9e5dc8b17c3824befc91a6/44ccd/images/copycode.svg "Copy service/networking/networkpolicy.yaml to clipboard")

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: test-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: db
  policyTypes:
    - Ingress
    - Egress
  ingress:
    - from:
        - ipBlock:
            cidr: 172.17.0.0/16
            except:
              - 172.17.1.0/24
        - namespaceSelector:
            matchLabels:
              project: myproject
        - podSelector:
            matchLabels:
              role: frontend
      ports:
        - protocol: TCP
          port: 6379
  egress:
    - to:
        - ipBlock:
            cidr: 10.0.0.0/24
      ports:
        - protocol: TCP
          port: 5978

```



## VOLUMES
https://kubernetes.io/docs/concepts/storage/volumes/
#volume #volumes 

#### AWS EBS configuration example[](https://kubernetes.io/docs/concepts/storage/volumes/#aws-ebs-configuration-example)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-ebs
spec:
  containers:
  - image: registry.k8s.io/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-ebs
      name: test-volume
  volumes:
  - name: test-volume
    # This AWS EBS volume must already exist.
    awsElasticBlockStore:
      volumeID: "<volume id>"
      fsType: ext4
```


## PERSISTENT VOLUMES
https://kubernetes.io/docs/concepts/storage/persistent-volumes/
#persistent #persistentvolume 
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pv-recycler
  namespace: default
spec:
  restartPolicy: Never
  volumes:
  - name: vol
    hostPath:
      path: /any/path/it/will/be/replaced
  containers:
  - name: pv-recycler
    image: "registry.k8s.io/busybox"
    command: ["/bin/sh", "-c", "test -e /scrub && rm -rf /scrub/..?* /scrub/.[!.]* /scrub/*  && test -z \"$(ls -A /scrub)\" || exit 1"]
    volumeMounts:
    - name: vol
      mountPath: /scrub
```



## PERSISTENT VOLUME CLAIM
https://kubernetes.io/docs/concepts/storage/persistent-volumes/
#PERSISTENTVOLUMECLAIM 

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: foo-pvc
  namespace: foo
spec:
  storageClassName: "" # Empty string must be explicitly set otherwise default StorageClass will be set
  volumeName: foo-pv
  ...
```


## NAMESPACE
https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
#NAMESPACE

## SECRETS
https://kubernetes.io/docs/concepts/configuration/secret/
#SECRETS #SECRET 

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mypod
    image: redis
    volumeMounts:
    - name: foo
      mountPath: "/etc/foo"
      readOnly: true
  volumes:
  - name: foo
    secret:
      secretName: mysecret
      optional: false # default setting; "mysecret" must exist
```
