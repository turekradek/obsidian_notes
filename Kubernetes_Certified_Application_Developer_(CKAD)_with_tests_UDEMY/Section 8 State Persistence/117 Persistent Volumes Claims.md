V 1 | PV 2 | PV 3|
|-|-|-|
| PVC 1|PVC 2 | PVC3|

- [ ] Sufficient Capacity
- [ ] Access Modes
- [ ] Volumes MOdes
- [ ] Storage Class

```PVC
selector:
	matchLabels:
		name: my-pv
```
match to
```PV
labels:
	name: my-pv
```

[[def persistent volume]]
#persistent #persistentvolume
<<<<<<< HEAD

## PersistentVolumeClaim 
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
	myclaim
spec:
	accessModes:
		- ReadWriteOnce
	resources:
		requests
			storage: 1Gi
	
=======
>>>>>>> main
