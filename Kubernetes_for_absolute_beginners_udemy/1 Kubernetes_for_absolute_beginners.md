[MINIKUBE ON UBUNTU WSL2]([Getting Minikube on WSL2 Ubuntu working (github.com)](https://gist.github.com/wholroyd/748e09ca0b78897750791172b2abb051))
[KUBERNETES ON WSL]([WSL+Docker: Kubernetes on the Windows Desktop | Kubernetes](https://kubernetes.io/blog/2020/05/21/wsl-docker-kubernetes-on-the-windows-desktop/))
`spis tresci
1. section 1 
2. section 2
3. section 3
4. section 4
5. section 5 [[Sec_5 Yaml  json xml]]
6. section 6 [[Sec_6 Kubernetes concepts - pods, replicaSets, deployments]]
7. section 7 [[Sec_7 Networking in Kubernetes]]
8. section 8 [[Sec_8 Services]]
9. section 9 [[Sec_9 Microservices Architecture]]
10. section 10 [[Sec_10 Kubernetes o Cloud]]
11. section 11 [[Sec_11 Conclusion]]
12. section 12 [[Sec_12 Appendix - setup multi node cluster using kubeadm]]

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

# section 5 : YAML introduction [[Sec_5 Yaml  json xml]]
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
22.

> Pods with YAML

```basic_yaml_config
apiVersion:
kind:
metadata:

spec:
```


```basic_yaml_config2
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		 app: myapp
		 type: front-end

spec:
	containers:
		- name: nginx-container
		  image: nginx
```

if file is created use command
> kubectl create -f pod-definition.yml

### 23 
to use kubect i need docker [[docker]]  file with problems if you use wsl linux 
## [kubectl instalation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
problems with kubectl instalation
f you see a message similar to the following, kubectl is not configured correctly or is not able to connect to a Kubernetes cluster.
```
The connection to the server <server-name:port> was refused - did you specify the right host or port?
```
[minikube instalation](https://minikube.sigs.k8s.io/docs/start/)

Exiting due to GUEST_DRIVER_MISMATCH: The existing "minikube" cluster was created using the "docker" driver, which is incompatible with requested "none" driver.
💡  Suggestion: Delete the existing 'minikube' cluster using: 'minikube delete', or start the existing 'minikube' cluster using: 'minikube start --driver=docker'


## Exercise 7 

PODs - 1

**Introduction:** Let us start simple! Given a **pod-definition.yml** file. We are only getting started with it. I have added two root level properties - apiVersion and kind.

**Instruction:** Add the missing two properties - **metadata** and **spec**
apiVersion:
kind:
metadata:
spec:

## Exercise 8
PODs - 2

**Introduction:** Let us now populate values for each property. Start with **apiVersion**. 

**Instruction:** Update value of **apiVersion** to **v1**. Remember to add a space between colon (:) and the value (v1)
apiVersion: v1
kind:
metadata:
spec:

## Exercise 9
PODs - 3

**Instruction:** Update value of **kind** to **Pod**.
apiVersion: v1
kind: Pod
metadata:
spec:

## Exercise 10

PODs - 4

**Introduction:** Let us now get to the metadata section. 

**Instruction:** Add a property "**name**" under metadata with value "**myapp-pod**". Remember to add a space before 'name' to make it a child of metadata
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:

## Exercise 11
**Introduction:** Let us add some labels to our Pod 

**Instruction:** Add a property "**labels**" under metadata with a child property "**app**" with a value "**myapp**". Remember to have equal number of spaces before "name" and "labels" so they are siblings

apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:

## Exercise 12
**Introduction:** We now need to provide information regarding the docker image we plan to use. 

**Instruction:** Add a property **containers** under **spec** section. Do not add anything under it yet.

apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
## Exercise 13
**Instruction:** Containers is an array/list. So create the **first** **element/item** in the array/list and add the following properties to it: **name** - **nginx** and **image** - **nginx**
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
    - name: nginx
      image: nginx

## Exercise 14
**Introduction:** Perfect! You have successfully created a Kubernetes-Definition file. Let us try it one more time, this time all on your own! 

**Instruction:** Create a Kubernetes Pod definition file using values below: 

-   **Name:** postgres 
-   **Labels:** tier => db-tier
-   **Container name:** postgres
-   **Image:** postgres

apiVersion: v1
kind: Pod
metadata:
  name: postgres
  labels:
    tier: db-tier
spec:
  containers:
    - name: postgres
      image: postgres

## Exercise 15

**Introduction:** Postgres [Docker image](https://hub.docker.com/_/postgres/) requires an environment variable to be set for password.  

**Instruction:** Set an environment variable for the docker container. **POSTGRES_PASSWORD** with a value **mysecretpassword**. I know we haven't discussed this in the lecture, but it is easy. To pass in an environment variable add a new property '**env**' to the container object. It is a sibling of image and name. **env** is an array/list. So add a new item under it. The item will have properties **name** and **value**. **name** should be the name of the environment variable - **POSTGRES_PASSWORD.** And **value** should be the password - **mysecretpassword**
apiVersion: v1
kind: Pod
metadata:
  name: postgres
  labels:
    tier: db-tier
spec:
  containers:
    - name: postgres
      image: postgres
      env:
        - name: POSTGRES_PASSWORD
          value: mysecretpassword

# 25

Hands-On Labs - Familiarise with the lab environment

#### Let's get real!

how many nodes are in cluster , version
> kubectl get nodes

kubernetes operating system check
>kubectl describe nodes

> kubectl describe pods 

>kubectl delete pod webapp


We have real labs for you that will help you get some real hands-on experience. Checkout the previous lecture to learn how to access the KodeKloud labs right in your browser!

  

First we start with a basic lab to get you familiarized with the lab environment:
[https://uklabs.kodekloud.com/topic/labs-familiarize-with-lab-environment-2/](https://uklabs.kodekloud.com/topic/labs-familiarize-with-lab-environment-2/)

Hands-On Labs

Access the hands-on labs here:

[https://uklabs.kodekloud.com/topic/labs-pods-with-yaml-2/](https://uklabs.kodekloud.com/topic/labs-pods-with-yaml-2/)

Create a new pod with the nginx image
> kubectl run nginx --image=nginx 

what is the image of pod 
> kubectl describe pod nazwa

which nodes are hthese pods placed on
> kubectl get pods -o wide 

how many containers are part of the pod webapp
> kubestl get pods 
> COntainers :

What images are used in the new webapp
> kubectl describe pod webapp

Create a new pod with the name redis and with the image redis123
>kubectl run redis --image=redis123
>kubectl run redis --image=redis123 --dry-run=client -o yaml > redis.yaml
>kubectl create -f redis.yaml

Change the image on this pod
> kubectl edit pod 
> cat redis.yaml
> kubectl apply -f redis.yaml

---
## - 28 replication cotrollers 

- [ ] replication controller oldest
- [ ] replica set newest 
if you want to create replication controller i kind dont use pod 
```replication
apiVersion: v1
kind: ReplicationCotroller
metadata:
  name: myapp-rc
  labels:
    app: myapp
    type: front-end
spec: # to replicate pod use template section 
  template: # in template section copy pod.yaml file excluding ~~api and kind
    metadata:
      name: myapp=pod
      labels:
        app: myapp
        type: front-pod
    spec:
      containers:
      - name: nginx-container
        image: nginx
  replicas: 3
  
```

~~apiVersion: v1
kind: Pod~~
metadata:
  name: postgres
  labels:
    tier: db-tier
spec:
  containers:
    - name: postgres
      image: postgres
      env:
        - name: POSTGRES_PASSWORD
          value: mysecretpassword

To create replication controller
>kubectl create -f rc-definition.yaml
>kubectl get replicationcontroller

## - 28 replicaset 

```replication
apiVersion: v1
kind: ReplicaSet
metadata:
  name: myapp-replicaset
  labels:
    app: myapp
    type: front-end
spec: # to replicate pod use template section 
  template: # in template section copy pod.yml file excluding ~~api and kind
    metadata:
      name: myapp=pod
      labels:
        app: myapp
        type: front-pod
    spec:
      containers:
      - name: nginx-container
        image: nginx
  replicas: 3
  selector:
    matchLabels:
      type: front-end
      
  # selector is a different part of file then replicacontroller
```
to create replicaset
>kubectl create -f replicaset-definition.yml
>kubectl get replicaset

replicaset monitor process and if some pod are deleted replicaset create new one
selector:
 matchLabels:
  type: front-end 
is the part of file to monitor app , replicaset know which pods monitor
how to scale repliaset
- first change replicas in file replicas: 3 - > replicas 6
- kubectl replace -f replicaset-definition.yml 
- kubectl scale --replias=6 -f replicaset-definition.yml
- kubectl scale --replicas=6 replicaset myapp=replicaset

 ## commands 
 create replicaset 
 > kubectl create -f replicaset-definition.yml   
 
 -f parametr   file to create replicaset
 
 to get created replicaset
 >kubectl get replicaset
 
 delete all replicaset myapp **alse deletes all underlying PODs**
 > kubectl delete replicaset myapp-replicaset 

replace or update replicaset 
>kubectl replace -f replicaset-definition.yml

scale replica set simply from the command line without having to modify
>kubectl scale--replicas=6 -f replicaset-defini


## 29 demo replicasets
[[replicasets.yml]]
 commands to set replicaset
 
 > kubectl create -f replicaset.yaml
 > kubectl get replicaset

 if is only one replicaset don't need write name of file to get replicaset
 kubectl ge tpods
 myapp-replicaset- uniqe
 myapp-replicaset- uniqe
 myapp-replicaset- uniqe
**if delete pod **
kubectl delete pod myapp-replicaset-uniqe 
still are 3 pods beceause replicaset created third


---
---
# INSTALATION KUBERNETES ON WINDOWS WSL
[LINK](https://kubernetes.io/blog/2020/05/21/wsl-docker-kubernetes-on-the-windows-desktop/)
 ```kubectl_run
run docker on windows


- [ ] docker version

-[ ] kubectl version


# Download the latest version of KinD
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-linux-amd64
# Make the binary executable
chmod +x ./kind
# Move the binary to your executable path
sudo mv ./kind /usr/local/bin/

> minikube start 

# Check if the .kube directory is created > if not, no need to create it
ls $HOME/.kube
# Create the cluster and give it a name (optional)
kind create cluster --name wslkind
# Check if the .kube has been created and populated with files
ls $HOME/.kube
> run docker image wslkind 
https://127.0.0.1:49153/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy


# Check how many nodes it created
kubectl get nodes
# Check the services for the whole cluster
kubectl get all --all-namespaces


# Delete the existing cluster
kind delete cluster --name wslkind



# Create a config file for a 3 nodes cluster
cat << EOF > kind-3nodes.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
  - role: worker
EOF


# Create a new cluster with the config file
kind create cluster --name wslkindmultinodes --config ./kind-3nodes.yaml
# Check how many nodes it created
kubectl get nodes

# Check the services for the whole cluster
kubectl get all --all-namespaces



# Install the Dashboard application into our cluster
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc6/aio/deploy/recommended.yaml
# Check the resources it created based on the new namespace created
kubectl get all -n kubernetes-dashboard


# Start a kubectl proxy
kubectl proxy
# Enter the URL on your browser: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/



# Create a new ServiceAccount
kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF
# Create a ClusterRoleBinding for the ServiceAccount
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF




# Get the Token for the ServiceAccount
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
# Copy the token and copy it into the Dashboard login and press "Sign in"

TOKEN
eyJhbGciOiJSUzI1NiIsImtpZCI6IlA5emkwbTQ0SHdxd3lYWFJONWhZTVdSZ3VVcUhuOHREMlptaDNYMVhIUjAifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLTdnOHM1Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiJiNDI5NzM2Ny03ZTVlLTQ3ZTUtYTEwYS02YmM5YjM3YTllOGMiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.hIX1672d-jW46HzP5BA5VgV4LWhWBvxmZdLaHeBvy8gXZFjcGDU7HX61f_rrjMobP9sxMAbCQu3SAH-aNUvekW3RmIA9QKFIBlblCKXPWZ4pnpYFsmAXdv-jPqu4tW18XC4vpp68GC38LKKPwWPhiObD9jLj9WRSg_XzsewTBzAXtnBUuXO-rzH1YLZsgWNBPf-Lol6VnY-3dYmIM4_ax48N7LA9aBCTFYTwWUOW3KRSjx4JyTSANLZvQG5UbIDOQ9qlpbSlEErq_v79YSCRhDrYFz2erFfKDALhNACw-7RhR_iPEKBimzbJSo6c4wuEkuJtf9JG9KP929qorKvhCg

```


[Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default)


```minikube_install

# Download the latest version of Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# Make the binary executable
chmod +x ./minikube
# Move the binary to your executable path
sudo mv ./minikube /usr/local/bin/
```

```create_mnikube
# Create a minikube one node cluster
minikube start --driver=none
```

```
# Install the conntrack package
sudo apt install -y conntrack
```

```
# Create a minikube one node cluster
minikube start --driver=none
# We got a permissions error > try again with sudo
sudo minikube start --driver=none
```

```
minikube: enabling systemD
# Install the needed packages
sudo apt install -yqq daemonize dbus-user-session fontconfig
```

> NIE SPRAWDZONE I POWODOWAŁO PROBLEMY W JEDNYM UBUNTU
```
# Create the start-systemd-namespace script
sudo vi /usr/sbin/start-systemd-namespace
#!/bin/bash

SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --system-unit=basic.target$' | grep -v unshare | awk '{print $2}')
if [ -z "$SYSTEMD_PID" ] || [ "$SYSTEMD_PID" != "1" ]; then
    export PRE_NAMESPACE_PATH="$PATH"
    (set -o posix; set) | \
        grep -v "^BASH" | \
        grep -v "^DIRSTACK=" | \
        grep -v "^EUID=" | \
        grep -v "^GROUPS=" | \
        grep -v "^HOME=" | \
        grep -v "^HOSTNAME=" | \
        grep -v "^HOSTTYPE=" | \
        grep -v "^IFS='.*"$'\n'"'" | \
        grep -v "^LANG=" | \
        grep -v "^LOGNAME=" | \
        grep -v "^MACHTYPE=" | \
        grep -v "^NAME=" | \
        grep -v "^OPTERR=" | \
        grep -v "^OPTIND=" | \
        grep -v "^OSTYPE=" | \
        grep -v "^PIPESTATUS=" | \
        grep -v "^POSIXLY_CORRECT=" | \
        grep -v "^PPID=" | \
        grep -v "^PS1=" | \
        grep -v "^PS4=" | \
        grep -v "^SHELL=" | \
        grep -v "^SHELLOPTS=" | \
        grep -v "^SHLVL=" | \
        grep -v "^SYSTEMD_PID=" | \
        grep -v "^UID=" | \
        grep -v "^USER=" | \
        grep -v "^_=" | \
        cat - > "$HOME/.systemd-env"
    echo "PATH='$PATH'" >> "$HOME/.systemd-env"
    exec sudo /usr/sbin/enter-systemd-namespace "$BASH_EXECUTION_STRING"
fi
if [ -n "$PRE_NAMESPACE_PATH" ]; then
    export PATH="$PRE_NAMESPACE_PATH"
fi
```

> NIE SPRAWDZONE I POWODOWAŁO PROBLEMY W JEDNYM UBUNTU
> TO TEZ

```
# Create the enter-systemd-namespace
sudo vi /usr/sbin/enter-systemd-namespace
#!/bin/bash

if [ "$UID" != 0 ]; then
    echo "You need to run $0 through sudo"
    exit 1
fi

SYSTEMD_PID="$(ps -ef | grep '/lib/systemd/systemd --system-unit=basic.target$' | grep -v unshare | awk '{print $2}')"
if [ -z "$SYSTEMD_PID" ]; then
    /usr/sbin/daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
    while [ -z "$SYSTEMD_PID" ]; do
        SYSTEMD_PID="$(ps -ef | grep '/lib/systemd/systemd --system-unit=basic.target$' | grep -v unshare | awk '{print $2}')"
    done
fi

if [ -n "$SYSTEMD_PID" ] && [ "$SYSTEMD_PID" != "1" ]; then
    if [ -n "$1" ] && [ "$1" != "bash --login" ] && [ "$1" != "/bin/bash --login" ]; then
        exec /usr/bin/nsenter -t "$SYSTEMD_PID" -a \
            /usr/bin/sudo -H -u "$SUDO_USER" \
            /bin/bash -c 'set -a; source "$HOME/.systemd-env"; set +a; exec bash -c '"$(printf "%q" "$@")"
    else
        exec /usr/bin/nsenter -t "$SYSTEMD_PID" -a \
            /bin/login -p -f "$SUDO_USER" \
            $(/bin/cat "$HOME/.systemd-env" | grep -v "^PATH=")
    fi
    echo "Existential crisis"
fi
```


```
# Edit the permissions of the enter-systemd-namespace script
sudo chmod +x /usr/sbin/enter-systemd-namespace
# Edit the bash.bashrc file
sudo sed -i 2a"# Start or enter a PID namespace in WSL2\nsource /usr/sbin/start-systemd-namespace\n" /etc/bash.bashrc
```
## Minikube: the first cluste

 
```
# Check if the KUBECONFIG is not set
echo $KUBECONFIG
# Check if the .kube directory is created > if not, no need to create it
ls $HOME/.kube
# Check if the .minikube directory is created > if yes, delete it
ls $HOME/.minikube
# Create the cluster with sudo
sudo minikube start --driver=none
```
> In order to be able to use `kubectl` with our user, and not `sudo`, Minikube recommends running the `chown` command

```bash
# Change the owner of the .kube and .minikube directories
sudo chown -R $USER $HOME/.kube $HOME/.minikube
# Check the access and if the cluster is running
kubectl cluster-info
# Check the resources created
kubectl get all --all-namespaces
```

```localhost
https://127.0.0.1:49153/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```
## Minikube: can I see a nice dashboard?
 

```bash
# Enable the Dashboard service
sudo minikube dashboard
# Access the Dashboard from a browser on Windows side

```
[Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default)

```bash
# Get all the services from the dashboard namespace
kubectl get all --namespace kubernetes-dashboard
```

```bash
# Edit the Dashoard service
kubectl edit service/kubernetes-dashboard --namespace kubernetes-dashboard
# Go to the very end and remove the last 2 lines
status:
  loadBalancer: {}
# Change the type from ClusterIO to LoadBalancer
  type: LoadBalancer
# Save the file
```

```bash
# Get all the services from the dashboard namespace
kubectl get all --namespace kubernetes-dashboard
# Access the Dashboard from a browser on Windows side with the URL: localhost:<port exposed>
```

```bash
# Get all the services from the dashboard namespace
kubectl get all --namespace kubernetes-dashboard
# Access the Dashboard from a browser on Windows side with the URL: localhost:<port exposed>
```


---

|NAME                      |          TYPE    |       CLUSTER-IP  |   EXTERNAL-IP |  PORT(S)     |    AGE|
|--|--|--|--|--|--|
|service/dashboard-metrics-scraper |  ClusterIP    |  10.96.60.199 | none |        8000/TCP       | 27m|
|service/kubernetes-dashboard        |LoadBalancer   |10.96.0.227   |pending|   443: **32238** /TCP |  27m|


|NAME                              |          READY  | UP-TO-DATE  | AVAILABLE |  AGE|
|--|--|--|--|--|
|deployment.apps/dashboard-metrics-scraper  | 1/1   |  1  |          1    |       27m|
|deployment.apps/kubernetes-dashboard     |   1/1  |   1    |        1     |      27m|



|NAME                                                  | DESIRED |  CURRENT  | READY |  AGE|
|--|--|--|--|--|
|replicaset.apps/dashboard-metrics-scraper-7b8b58dc8b   |1        | 1     |    1  |     27m|
|replicaset.apps/kubernetes-dashboard-5f5f847d57       | 1    |     1    |     1    |   27m|


localhost:32238 


---




```COMMANDS
  235  docker version
  236  kubectl version
  237  curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-linux-amd64
  238  chmod +x ./kind
  239  sudo mv ./kind /usr/local/bin/
  240  echo $KUBECONFIG
  241  ls $HOME/.kube
  242  kind create cluster --name wslkind
  243  ls $HOME/.kube
  244  kubernetes cluster-info
  245  kubectl cluster-info
  
```

 kubectl cluster-info
 > Kubernetes control plane is running at https://127.0.0.1:49153
 
 ```counting_1_2_3
# Check how many nodes it created
kubectl get nodes
# Check the services for the whole cluster
kubectl get all --all-namespaces
```
## KinD: can I see a nice dashboard?[](https://kubernetes.io/blog/2020/05/21/wsl-docker-kubernetes-on-the-windows-desktop/#kind-can-i-see-a-nice-dashboard)

Working on the command line is always good and very insightful. However, when dealing with Kubernetes we might want, at some point, to have a visual overview.

For that, the [Kubernetes Dashboard](https://github.com/kubernetes/dashboard) project has been created. The installation and first connection test is quite fast, so let's do it:

```bash
# Install the Dashboard application into our cluster
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc6/aio/deploy/recommended.yaml
# Check the resources it created based on the new namespace created
kubectl get all -n kubernetes-dashboard
```
As it created a service with a ClusterIP (read: internal network address), we cannot reach it if we type the URL in our Windows browser:
That's because 
we need to create a temporary proxy:
```temporary_proxy
# Start a kubectl proxy
kubectl proxy
# Enter the URL on your browser: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

```dashboards_kubernetes
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default
```

> kubectl proxy


## my token
```token
eyJhbGciOiJSUzI1NiIsImtpZCI6ImdXUVpRWFYtT0hzR2ZJOHZZUGNkM1o3a180OWtHZ1ZsZ244Y3BNUVhSd1UifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLXBjOTU5Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI2NjdlYzllZC0xOTNmLTRlMTUtYWNlYy03YzMzZDdlODJhNjciLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.K4WBHx54eNeswfRfmPXfm3SOHrTy2grZ_qrygKE1hM4HFTtsY5saKTeAiH6jpfkZWjFOLUNbybY6ieS6WbPvp2lPatu923e6gc5rVsfx9ZsuM-DbdwcbLvLPqjU53tTZXxQllYVBkJ_a4gt0THyozvtAV0FC9Zqo04IPazLsFguK9YXWoJDannDHEb3wQ5aqGjglrRxVXhnyjLsmO0XZl-r9q9erBo9QG-UrAghwZY9P9ze2elFIN9ACkWsmcJDSOlrzN9555Og2HndaO5XD8gunuitGj-2Vlup7lCnhFnaex8ufMkA0e3KlkSM-tmzkP5lkIAE9tb2RPITF8mfmhA
```
## 32 DEPLOYMENT

<<<<<<< HEAD
```defiition_file
apiVersion: apps/v1
kind: RaplicaSet
metadata:
  name: myapp-deployment
  labels: # all matchlabels or labels should by thesome
    app: myapp
    type: fornt-end
spec:
	template:
		metadata:
			name: myapp-pod
			labels:
				app: myapp
				type: fornt-end
		spec:
			containers:
			- name: nginx-container
			  image: nginx
replicas: 3
selector: 
	matchLabels:
		type: front-end
```
> kubectl create -f deployment-definition.yml
< komentarz nie widoczny >
> kubectl get deployments 
**deployment create automaticly replicaset and rs automatically create pods**
kubectl get all  - shows all of objects

## 33 demo deployments - create deplyment
-[ ]  new folder
-[ ] deployment.yaml
=======
## after i have beed returned from sweden 
> office_21_11

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
# Sec_7 Networking in Kubernetes 39

- [ ] ip adres to access to kubernetes cluster 192.168.1.2
- [ ] ip addres sis assigned to a pod  10.244.0.2
- [ ] after created container is created to network 10.244.0.0 
- [ ] after that all pods are created with those addresses 10.244.0.3  4  2 

> multiple nodes

| cluster | ip address | web ip address | pods ip address |
|-------|--|--|---|
|192.168.1.2       | |    |192.169.1.3                    | 
| 10.244.0.0    |         |        |     10.244.0.0       |
|10.244.0.2|10.244.0.3    | 10.244.0.2    | 10.244.0.3    |
|    pod        |  pod    |     pod       |     pod       |


> if the same cluster conflict 10.244.0.0

routing between nodes 

--- 
# sec 8 services node port 
connect aplications together and with users 

laptop 192.168.2.10 > node (192.168.1.2) > node web (10.244.0.0) > pod (10.244.0.2)

- [ ] ssh curl http://10.244.0.2   only inside 
- [ ] kubernetes service laptop > curl http://192.168.1.2:30008 < node 30008 > service > pod and web 
> sevice is like pod object use to connect web and pod 

## services types
- [ ] nodeport         on the wall of node  30008 (30000-32767)> service > 80 (port) > 80 (target port) > pod 


      ```
        apiVerion: v1
        kind: Sevice
        metadata:
            name: myapp-service
        spec:
            type: NodePort
            ports:
              - targetPort: 80   # port on pod
                port: 80         # port on service 
                nodePort: 30008  # on the wall of node 
            **selector: # this part is from pod-definition.yml from labels:
                app: myapp
                type: front-end** 
               
      ```

>pod-definition.yml

> apiVersion: v1
```
 kind: Pod
 metadata:
   name: myapp-pod
   labels:
     app: myapp
     type: front-end
 spec:
   containers:
   - name: nginx-container
     image: ngoinx
```
> kubectl create -f service-definition.yml 
> kubectl get services 


| NAME | TYPE | CLUSTER-IP | EXTERNAL-IP | PORT(S) | AGE|
|----|---|----|----|---|----|
|myapp-service| NodePOrt|  10.106.127.123|  none |  80:30008/TCP | 5m|

> CURL HTTP://192.1.2:30008

|              |      |        USER   |      |     |       |
|-------       |------|------------|---------|---- |-------  |
|CURL HTTP://192.168.1.2:30008 |      | CURL HTTP://192.168.1.2:30008 | |  CURL HTTP://192.168.1.4:30008  | |
|   NODE 1     |      |  NODE 2              |     |    NODE 3         | |
|192.168.1.2   | 30008|192.168.1.3           |30008|    192.168.1.4    |30008 |
|              |      |        SERVICE       |     |                   |  |
|  10.244.0.3  |      |       10.244.0.2     |     |       10.244.0.4  |  |
|   POD 1      |      |        POD 2         |     |         POD  3    |  |





- [ ] clusterip       inside of node
- [ ] loadBalancer  1 point outside the wall of node and 3 points on the wall of node 


## 41  Demo - Service

check service after apply 
> kubectl get svc

> minikube service myapp-service --url
 - [ ] go to web browser 

## 42 Services - ClusterIP

| front-end | 10.244.0.3 |10.244.0.2 | 10.244.0.4|
| -- | -- | -- | -- |
| |  back-end| | 
| back-end|10.244.0.3|10.244.0.5|10.244.0.8|
|   | redis |||
| redis |10.244.0.4|10.244.0.7|10.244.0.10|

```service_def_clusterIP
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: ClusterIP
  ports:
    - targetPort: 80
      port: 80
  selector:
    app: myapp
    type: back-end
```


## 43 Service ClusterIP

 ![[kubernetes_service_load_balancer.png]]

```load_balancer
apiVersion: v1
kind: Service
metadata:
	name: myapp-service
spec:
	type: LoadBalancer
	ports:
	  - targetPort: 80
	    port: 80
	    nodePort: 30008
```

## Labs 30 .. 37 

```end_file
apiVersion: v1
kind: Service
metadata:
  name: image-processing
  labels:
    app: myapp
spec:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 8080
  selector:
    tier: backend
```

| pod def | replicaset | deployment | services|
|-|-|-|-|
|[[definition-pod nginx.yml]]|[[definition-replicas replicasets.yml]]|[[definition-deployment.yaml]]|nodePort ClusterIP LoadBalancer

| nodePort | ClusterIP |  LoadBalancer |
|-|-|-|
|[[def_nodePort]] | [[def_ClusterIP]] | [[def_loadBalancer]]|


---
# Section 9: Microservices Architecture

[[Sec_9 Microservices Architecture]]
how to run microservices
docke run -d --name=redis  redis
docke run -d --name=db postgres:9.4
docke run -d --name=vote -p 5000:80 --link redis:redis voting-app
docke run -d --name=result  -p 5001:80 --link db:db result-app
docke run -d --name=worker --link db:db -- link redis:redis   worker

| voting-app|  | resulg-app|
|-|-|-|
|     \ | |     / |
|in-memory DB | |db |
|     \ | |     / |
| | worker| |

> how to  deploy
- [ ] deploy containers
- [ ] enable connectivity 
- [ ] external access

### steps
1.  deploy pods
2.  create services (ClusterIP)
	1. redis
	2. db 
3. Create Services (NodePort)
	1. voting-app
	2. result-app
	
```kokekloud_47
kodekloudhub/example-voting-app
forged from dockersamples/example-voting-app

kodekloud/examplevotingapp_vote:v1                    kodekloud/examplevotingapp_result:v1
redis   postrgesql
    worker  kodekloud/examplevotingapp_worker:v1

```

### 48 DEMO DEPLOING MICROSERVICES APPLICATION ON KUBERNETES 

 check url
 > minikube service voting-service --url

### 49 demo deploying microservices application on kubernetes with deplyments 

### 50 Article: demo lectiure manifest files

 Demo lecture manifest files are available in the below repository:
 [https://github.com/kodekloudhub/example-voting-app-kubernetes](https://github.com/kodekloudhub/example-voting-app-kubernetes)
 

---
# Section 10: Kubernetes on Cloud
[[Sec_10 Kubernetes o Cloud]]

### 51 Kubernetes on Cloud  Introduction
### 52 Kubernetes on GCP (GKE)

 https://cloud.google.com/free/docs/gcp-free-tier
 

### 53 Reference -Google Cloud Platform 
If you haven't created an account already, you can get FREE 12 Months subscription to Google Cloud Platform. Check it out here:

[https://cloud.google.com/free/](https://cloud.google.com/free/)

Kubernetes on Google Cloud: [https://cloud.google.com/kubernetes-engine/docs/](https://cloud.google.com/kubernetes-engine/docs/)


### 54 Kubernetes on AWS (EKS)
 Pre-Requisite
- [ ] AWS Account:
https://aws.amazon.com/free/
- [ ] Installing Kubectl cli 
- [ ] EKS Cluster Role
- [ ] IAM Role for Node Group
- [ ] VPC
- [ ] EC2 Key Pair which can be used to SSH to the worker nodes
- [ ] AWS Basics
 > https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html

 
---
# Section 11: Conclusion

[[Sec_11 Conclusion]]

---
# Section 12: Appendix - setup multi node cluster using kubeadm

[[Sec_12 Appendix - setup multi node cluster using kubeadm]]


---
