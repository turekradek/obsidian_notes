## Volumes & Mounts #volume #volumes #mount 
[[def pod.yaml]]


## Volume 
```
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
		  volumeMounts: # we mount the volume to a directory inside the container
		  - mountPath: opt # name of folder whera is directory mounted 
		    name: data-volume # name of this volume
	volumes:
	- name: data-volume
	  hostPath:
		  path: /data # This way, any files created in the volume would be stored in the directory data on my node.
		  type: Direcotry            # /data good for single pod not for many
```

[[Kubernetes Certified Application Developer (CKAD) with tests UDEMY/volumes and mounts.jpg]]

![[Kubernetes Certified Application Developer (CKAD) with tests UDEMY/volumes and mounts.jpg]]











