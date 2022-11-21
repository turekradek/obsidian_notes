## after i have beed returned from sweden 

## 34
exercise only

## 36 deplyments update and rollback

> kubectl create -f deplyment.yaml

> kubectl rollout status deplyment.apps/myapp-deplyment 

status successfully rolled out 
history deployment 
> kubectl rollout history deplyment.apps/myapp-deplyment 


Let us try that. Upgrade the application by setting the image on the deployment to kodekloud/webapp-color:v2

Do not delete and re-create the deployment. Only set the new image name for the existing deployment.

>  kubectl edit deployment ..
> kubectl rollout undo deployment....


- [ ] check box 

~~skreslenie~~

**pogrubienie**

---
# Sec_7 Networking in Kubernetes 

