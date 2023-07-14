rollout command
>kubectl rollout status deployment/myapp-deployment

history

> kubectl rollout history deployment/myapp-depl

deployment startegy
|deployment| stategy |
|-|-|
|Recreate| RollingUpdate|

#DEPLOYMENT
1. destroy and create new instances of newe appliation version
2. destroy one by one and deploy each after destroing 

kubectl apply -f deployment-definition.yaml

[[definition-deployment.yaml]]

>kubectl set umage deployment/myapp-dep \
nginx=nginx:1.9.1

## Rollback
#ROLLBACK

>kubectl rollout undo deployment/myapp-deployment

<table>
	<tr>
		<td>Create</td>	<td>kubectl create -f deployment-definition.yml</td> 
	</tr>
	<tr>
		<td>Get</td> <td>kubectl get deployments</td>
	</tr>
	<tr>
		<td>Update</td> <td>kubectl apply -f deployment-definition.yml</td>
	</tr>
	<tr>
		<td>Update</td> <td>kubectl set image deployment/myapp-deployment nginx=nginx:1.9.1</td>
	</tr>
	<tr>
		<td>Status</td> <td>kubectl rollout status deployment/myapp-deployment</td>
	</tr>
	<tr>
		<td>Status</td> <td>kubectl rollout history  deployment/myapp-deployment</td>
	</tr>
	<tr>
		<td>Rollback</td> <td>kubectl rollout undo deployment/myapp-deployment</td>
	</tr>
</table>
