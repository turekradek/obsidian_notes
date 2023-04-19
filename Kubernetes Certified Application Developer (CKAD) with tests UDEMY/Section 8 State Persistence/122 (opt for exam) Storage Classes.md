[[def_pvc_and_pvcs.png]]

```pod_def
apiVersion: v1
kind: Pod
metadata:
	name: random-numer-generator
spec:
	containers:
		- name: alpine
		  image: alpine
		  command: ["/bin/sh","-c"]
		  args: ["shuf -i 0-100 -n 1 >> /opt/number.out;"]
		  volumeMounts:
		  - mountPath: opt
		    name: data-volume
	volumes:
	- name: data-volume
	  persistentVolumeClaim:
		  claimName: myclaim
```

```pv_def
apiVersion: v1
kind: PersistentVolume
metadata:
	name: pv-vol1
spec:
	accessModes:
		- ReadWriteOnce
	capacity:
		storage: 500Mi
	gcePersistentDisk:
		pdName: pd-disk
		fsType: ext4
```

```pvc_definition_yaml
apiVersion: v1
kind: PersistentVolumecLAIM
metadata:
	name: my-claim
spec:
	accessModes:
		- ReadWriteOnce
	storageClassName: google-storage
	resources:
		requests:
			storage: 500Mi
```

```storage_calss_def
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
	name: google-storage
provisioner: kubernetes.io/gce-pd
```

| sc def yaml| pvc def yaml | pod def yaml|
|-|-|-|
| | | |

[[def_pvc_and_pvcs.png]]

![[def_pvc_and_pvcs.png]]

before this PV is created, you must have created,
the disk on Google Cloud.
Every time an application requires storage,
you have to first manually provision,
the disk on Google Cloud and then,
manually create a persistent volume definition file.
Using the same name as that of the disk that you created.
> gcloud beta compute disks create \
> 	--size 1GB
> 	--region us-east1
> 	pd-disk

