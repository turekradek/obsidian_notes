
5.
A new deployment called `frontend-v2` has been created in the default namespace using the image `kodekloud/webapp-color:v2`. This deployment will be used to test a newer version of the same app.
  
Configure the deployment in such a way that the service called `frontend-service` routes less than 20% of traffic to the new deployment.  
Do not increase the replicas of the `frontend` deployment.

The `frontend-v2` deployment currently has 2 replicas. The `frontend` service now routes traffic to 7 pods in total ( 5 replicas on the `frontend` deployment and 2 replicas from `frontend-v2` deployment).
Since the service distributes traffic to all pods equally, in this case, approximately 29% of the traffic will go to `frontend-v2` deployment.
To reduce this below 20%, scale down the pods on the v2 version to the minimum possible replicas = `1`.
Run: `kubectl scale deployment --replicas=1 frontend-v2`
Once this is done, only ~17% of traffic should go to the v2 version.

6. k scale deploy frontend --replicas=0
	1. k scale deploy frontend-v2 --replicas=5