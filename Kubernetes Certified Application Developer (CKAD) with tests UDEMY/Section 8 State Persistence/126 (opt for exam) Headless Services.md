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






