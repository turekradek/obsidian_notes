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

[[116 Persistent Volumes]]


