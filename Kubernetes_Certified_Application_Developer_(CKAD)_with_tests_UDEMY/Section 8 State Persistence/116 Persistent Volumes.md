[[115 Volumes]]
[[Kubernetes Certified Application Developer (CKAD) with tests UDEMY/volumes and mounts.jpg]]

## PersistentVolume 
```
apiVersion: v1
kind: PersistentVolume
metadata:pv-vol1random-numer-generator
spec:
	accessModes:
		- ReadWriteOnce
	capacity:
		storage: 1Gi
	hostPath:
		path: /tmp/data
	awsElasticBlockStore:
		volumeID: <volume-id>
		fsType: ext4
```
[[def persistent volume]]

> kubectl create -f pv-definition.yaml 

| pod1 | pod2 | pod3 | pod4 |
|-|-|-|-|
| ! | ! | ! | ! |
| PVC1|PVC2|PVC3|PVC4|

Persistent Volumes (PVs )