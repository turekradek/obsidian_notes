Note on default resource requirements and limits

In the previous lecture, I said - "When a pod is created the containers are assigned a default CPU request of .5 and memory of 256Mi". For the POD to pick up those defaults you must have first set those as default values for request and limit by creating a LimitRange in that namespace.

  

```
1.  apiVersion: v1
2.  kind: LimitRange
3.  metadata:
4.    name: mem-limit-range
5.  spec:
6.    limits:
7.    - default:
8.        memory: 512Mi
9.      defaultRequest:
10.        memory: 256Mi
11.      type: Container
```

[https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/)

  

```
1.  apiVersion: v1
2.  kind: LimitRange
3.  metadata:
4.    name: cpu-limit-range
5.  spec:
6.    limits:
7.    - default:
8.        cpu: 1
9.      defaultRequest:
10.        cpu: 0.5
11.      type: Container
```

[https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/cpu-default-namespace/](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/cpu-default-namespace/)

  

**References:**

[https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource)