# ACCES THE LABS
Accessing the Labs

All hands-on labs are hosted on KodeKloud. Use this link to register for the labs associated with this course. Please make sure to use the same name as your profile in Udemy. That's how we know you are our Udemy student.

### Image  ! [ alt text ] (link)
![alt text](https://www.markdownguide.org/assets/images/tux.png)

Note: You don't have to make any additional payment. For now simply enrol in the lab course. We'll tell you when you start practicing once we start learning concepts.

[LINK TO LAB]([https://uklabs.kodekloud.com/courses/labs-kubernetes-for-the-absolute-beginners-hands-on/](https://kodekloud.com/courses/labs-kubernetes-for-the-absolute-beginners-hands-on/) 

Apply the coupon code **k-labs-k8b-lakjg328321095305**

1 lab
kubectl version
kubectl get nodes
kubectl describe nodes 

---

|**SETUP KUBERNETES**| CLOUDS |[kodekloud](www.kodekloud.com)|
|----------------|--------|---|
| MINIKUBE | Google Cloud Platform |--|   
| MikroK8s | Amazon Web Service |--|
| Kubeadm | Microsoft Azure |--|

---
**Minikube**
for windows minikube.exe for linux vm 

Reference

The upcoming demo is completely optional, unless you want to setup a local environment on your laptop. Our hands-on labs will be sufficient for you to practice.

Some links used in the upcoming demo may have changed. Please find the latest links to the documentation topics below:

Install MiniKube: [https://kubernetes.io/docs/tasks/tools/install-minikube/](https://kubernetes.io/docs/tasks/tools/install-minikube/)

VirtualBox: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

MiniKube Download page for  Windows: [https://github.com/kubernetes/minikube/releases](https://github.com/kubernetes/minikube/releases)

  

While using Minikube with  Virtualization technologies, specify the `--vm-driver` option like this:

1.  minikube start --vm-driver=<driver_name>

More about it here: [https://kubernetes.io/docs/setup/learning-environment/minikube/#specifying-the-vm-driver](https://kubernetes.io/docs/setup/learning-environment/minikube/#specifying-the-vm-driver)

---


References

Install and set up the kubectl tool: -

[https://kubernetes.io/docs/tasks/tools/](https://kubernetes.io/docs/tasks/tools/)

  

Install Minikube: -

[https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/)

  

Install VirtualBox: -

[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

[https://www.virtualbox.org/wiki/Linux_Downloads](https://www.virtualbox.org/wiki/Linux_Downloads)

  

Minikube Tutorial: -

[https://kubernetes.io/docs/tutorials/hello-minikube/](https://kubernetes.io/docs/tutorials/hello-minikube/)  

If the minikube installation has been done on the macOS, then to access the URL on the local browser, we need to do a few steps to get the service URL to work. Those steps are covered on this documentation page: -

[https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-service-with-tunnel](https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-service-with-tunnel)



---
**section 4. Kubernetes concepts**


oc run nginx --image nginx          - instruction of creating pods 

**17 demo pods**
oc run nginx --image=nginx  image from docker hub for example 
> 
> oc import how to import image 
> 

 ```comment
 oc import-image --help
 ```

 - [ ] oc get pods
 - [ ] get pods
 - [ ] oc get pods --selector cronjob-release-notes-27789480-j7f9l
 - [ ] oc get pods --selector cronjob-release-notes
 - [ ] oc get pods cronjob-release-notes-27789480-j7f9l
 - [ ]  - oc get pods --selector app=cronjob-release-notes
 - [ ]  - oc get pods
 - [ ]  - oc get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |tr -s '[[:space:]]' '\n' |sort |uniq -c
 - [ ]  - oc get pods  --help
 - [ ]  - [] oc get pods -o jsonpath="{.items[*].spec.containers[*].image}" |tr -s '[[:space:]]' '\n' |sort |uniq -c
 - [ ]  - oc get pods -o jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' |sort
 - [ ]  - oc get pods
 - [ ]  - oc describe pod cronjob-release-notes-27789480-j7f9l
 - [ ]  - oc image  pod cronjob-release-notes-27789480-j7f9l
 - [ ]  - oc image -h
 - [ ]  - oc get pods -o wide

- [ ] a - [ ] 
```comment
how to copy whole pod 
```

You can create pods from the command line using the below command:

**Create an NGINX Pod**

```Create_an_NGINX_POD
kubectl run nginx --image=nginx
```

[Kubernetes Concepts]( [https://kubernetes.io/docs/concepts/](https://kubernetes.io/docs/concepts/)
[Pod Overwiew]([https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/))

[Pods]([Pods | Kubernetes](https://kubernetes.io/docs/concepts/workloads/pods/))
[List All Container Images Running in a Cluster]([List All Container Images Running in a Cluster | Kubernetes](https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/))
[Pods Deployments]([Deployments | Kubernetes](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/))

# section 5 : YAML introduction
configuration files xml , json yaml
xml
```xml
<Serers>
	<Server>
		<name>Server1</name>
		<owner>John</owner>
		<created>12345</created>
		<status>active</status>
	</Server>
</Serers>	
```
JSON
```JSON
{
	Servers: [
		{
			name: Server1,
			owner: John,
			created: 12345,
			status: active
		}
	]
}
```
YAML
```YAML
Servers:
	- name: Server1
	- owner: John
	- created: 12345
	- status: active
```
yaml
key value pair
fruit: apple
meat: chicken

should be space after : 
spaces in yaml
> corect spaces
```corect spaces
Banana:
	Calories: 100
	Fat: 0.4 g
	Carbs: 27 g
```
```incorect_
Banana:
	Calories: 100
		Fat: 0.4 g
		Carbs: 27 g
```

yaml 
```more_advance
	Fruits:
		-	Banana:
				Calories: 100
				Fat: 0.4 g
				Carbs: 27 g
		-    Apple:
				Calories: 100
				Fat: 0.4 g
				Carbs: 27 g
```

## Exersice
1. Update the **food.yml** file to add a **Vegetable** - **Carrot.**
	Fruit: Apple
	Drink: Water
	Dessert: Cake
	Vegetable: Carrot
2. Update the **food.yml** file to add a list of **Vegetables** - **Carrot**, **Tomato**, **Cucumber**
	Fruits:
	  - Apple
	  - Banana
	  - Orange
	Vegetables:
	    - Carrot
	    - Tomato
	    - Cucumber
3. Jacob is **30** year old Male working as a **Systems Engineer** at a firm. Represent Jacob's information (**Name, Sex, Age, Title**) in YAML format. Create a dictionary named **Employee** and define properties under it.
	Employee:
	    Name: Jacob
	    Sex: Male
	    Age: 30
	    Title: Systems Engineer 
5. Update the YAML file to represent the Projects assigned to Jacob. Remember Jacob works on Multiple projects - **Automation** and **Support**. So remember to use a list.
		Employee:
		  Name: Jacob
		  Sex: Male
		  Age: 30
		  Title: Systems Engineer
		  Projects:
				    - Automation
				    - Support 
6. Update the YAML file to include Jacob's pay slips. Add a new property "**Payslips**" and create a list of pay slip details (Use list of dictionaries). Each payslip detail contains **Month** and **Wage**.
		Employee:
		  Name: Jacob
		  Sex: Male
		  Age: 30
		  Title: Systems Engineer
		  Projects:
				    - Automation
				    - Support
		  Payslips:
				    - Month: June
			Wage: 4000
				    - Month: July
			Wage: 4500
				    - Month: August
			Wage: 4000

---


# Section 6: kubernetes concepts - pods , replicasets, deployments 




---
# Section 7: Netowrking in Kubernetes

### 22 Pods with YAML
```template_of_yaml_in_kubernetes
apiVersion:
kind:
metadata:




spec:
```



---
# Section 8: Services
[[Sec_8 Services]]



---
# Section 9: MIcroservices Architecture

[[Sec_9 Microservices Architecture]]

---
# Section 10: Kubernetes on Cloud
[[Sec_10 Kubernetes o Cloud]]


---
# Section 11: Conclusion

[[Sec_11 Conclusion]]

---
# Section 12: Appendix - setup multi node cluster using kubeadm

[[Sec_12 Appendix - setup multi node cluster using kubeadm]]


---
