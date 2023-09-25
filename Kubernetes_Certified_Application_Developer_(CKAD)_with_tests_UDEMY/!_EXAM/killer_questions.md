# CKAD Simulator Kubernetes 1.27

[https://killer.sh](https://killer.sh/)

#### Pre Setup

Once you've gained access to your terminal it might be wise to spend ~1 minute to setup your environment. You could set these:

alias k=kubectl                         # will already be pre-configured

export do="--dry-run=client -o yaml"    # k create deploy nginx --image=nginx $do

export now="--force --grace-period 0"   # k delete pod x $now

##### Vim

The following settings will already be configured in your real exam environment in `~/.vimrc`. But it can never hurt to be able to type these down:

set tabstop=2

set expandtab

set shiftwidth=2

More setup suggestions are in the **tips section**.

## Question 1 | Namespaces

_Task weight: 1%_

The DevOps team would like to get the list of all _Namespaces_ in the cluster. Get the list and save it to `/opt/course/1/namespaces`.


## Question 2 | Pods

_Task weight: 2%_

Create a single _Pod_ of image `httpd:2.4.41-alpine` in _Namespace_ `default`. The _Pod_ should be named `pod1` and the container should be named `pod1-container`.

Your manager would like to run a command manually on occasion to output the status of that exact _Pod_. Please write a command that does this into `/opt/course/2/pod1-status-command.sh`. The command should use `kubectl`.


## Question 3 | Job

_Task weight: 2%_

Team Neptune needs a _Job_ template located at `/opt/course/3/job.yaml`. This _Job_ should run image `busybox:1.31.0` and execute `sleep 2 && echo done`. It should be in namespace `neptune`, run a total of 3 times and should execute 2 runs in parallel.

Start the _Job_ and check its history. Each pod created by the _Job_ should have the label `id: awesome-job`. The job should be named `neb-new-job` and the container `neb-new-job-container`.


## Question 4 | Helm Management

_Task weight: 5%_

Team Mercury asked you to perform some operations using Helm, all in _Namespace_ `mercury`:

1. Delete release `internal-issue-report-apiv1`
2. Upgrade release `internal-issue-report-apiv2` to any newer version of chart `bitnami/nginx` available
3. Install a new release `internal-issue-report-apache` of chart `bitnami/apache`. The _Deployment_ should have two replicas, set these via Helm-values during install
4. There seems to be a broken release, stuck in `pending-install` state. Find it and delete it

## Question 5 | ServiceAccount, Secret

_Task weight: 3%_

Team Neptune has its own _ServiceAccount_ named `neptune-sa-v2` in _Namespace_ `neptune`. A coworker needs the token from the _Secret_ that belongs to that _ServiceAccount_. Write the base64 decoded token to file `/opt/course/5/token`.


## Question 6 | ReadinessProbe

_Task weight: 7%_

Create a single _Pod_ named `pod6` in _Namespace_ `default` of image `busybox:1.31.0`. The _Pod_ should have a readiness-probe executing `cat /tmp/ready`. It should initially wait 5 and periodically wait 10 seconds. This will set the container ready only if the file `/tmp/ready` exists.

The _Pod_ should run the command `touch /tmp/ready && sleep 1d`, which will create the necessary file to be ready and then idles. Create the _Pod_ and confirm it starts.

## Question 7 | Pods, Namespaces

_Task weight: 4%_

The board of Team Neptune decided to take over control of one e-commerce webserver from Team Saturn. The administrator who once setup this webserver is not part of the organisation any longer. All information you could get was that the e-commerce system is called `my-happy-shop`.

Search for the correct _Pod_ in _Namespace_ `saturn` and move it to _Namespace_ `neptune`. It doesn't matter if you shut it down and spin it up again, it probably hasn't any customers anyways.


## Question 8 | Deployment, Rollouts

_Task weight: 4%_

There is an existing _Deployment_ named `api-new-c32` in _Namespace_ `neptune`. A developer did make an update to the _Deployment_ but the updated version never came online. Check the _Deployment_ history and find a revision that works, then rollback to it. Could you tell Team Neptune what the error was so it doesn't happen again?

## Question 9 | Pod -> Deployment

_Task weight: 5%_

In _Namespace_ `pluto` there is single _Pod_ named `holy-api`. It has been working okay for a while now but Team Pluto needs it to be more reliable. Convert the _Pod_ into a _Deployment_ with 3 replicas and name `holy-api`. The raw _Pod_ template file is available at `/opt/course/9/holy-api-pod.yaml`.

In addition, the new _Deployment_ should set `allowPrivilegeEscalation: false` and `privileged: false` for the security context on container level.

Please create the _Deployment_ and save its yaml under `/opt/course/9/holy-api-deployment.yaml`.


# /opt/course/9/holy-api-deployment.yaml

apiVersion: apps/v1

kind: Deployment

metadata:

  name: holy-api        # name stays the same

  namespace: pluto # important

spec:

  replicas: 3 # 3 replicas

  selector:

    matchLabels:

      id: holy-api  # set the correct selector

  template:

    # => from here down its the same as the pods metadata: and spec: sections

    metadata:

      labels:

        id: holy-api

      name: holy-api

    spec:

      containers:

      - env:

        - name: CACHE_KEY_1

          value: b&MTCi0=[T66RXm!jO@

        - name: CACHE_KEY_2

          value: PCAILGej5Ld@Q%{Q1=#

        - name: CACHE_KEY_3

          value: 2qz-]2OJlWDSTn_;RFQ

        image: nginx:1.17.3-alpine

        name: holy-api-container

        securityContext:                   # add

          allowPrivilegeEscalation: false  # add

          privileged: false                # add

        volumeMounts:

        - mountPath: /cache1

          name: cache-volume1

        - mountPath: /cache2

          name: cache-volume2

        - mountPath: /cache3

          name: cache-volume3

      volumes:

      - emptyDir: {}

        name: cache-volume1

      - emptyDir: {}

        name: cache-volume2

      - emptyDir: {}

        name: cache-volume3


## Question 10 | Service, Logs

_Task weight: 4%_

Team Pluto needs a new cluster internal _Service_. Create a ClusterIP _Service_ named `project-plt-6cc-svc` in _Namespace_ `pluto`. This _Service_ should expose a single _Pod_ named `project-plt-6cc-api` of image `nginx:1.17.3-alpine`, create that _Pod_ as well. The _Pod_ should be identified by label `project: plt-6cc-api`. The _Service_ should use tcp port redirection of `3333:80`.

Finally use for example `curl` from a temporary `nginx:alpine` _Pod_ to get the response from the _Service_. Write the response into `/opt/course/10/service_test.html`. Also check if the logs of _Pod_ `project-plt-6cc-api` show the request and write those into `/opt/course/10/service_test.log`.

## Question 11 | Working with Containers

_Task weight: 7%_

During the last monthly meeting you mentioned your strong expertise in container technology. Now the Build&Release team of department Sun is in need of your insight knowledge. There are files to build a container image located at `/opt/course/11/image`. The container will run a Golang application which outputs information to stdout. You're asked to perform the following tasks:

> **_NOTE:_** Make sure to run all commands as user `k8s`, for docker use `sudo docker`

1. Change the Dockerfile. The value of the environment variable `SUN_CIPHER_ID` should be set to the hardcoded value `5b9c1065-e39d-4a43-a04a-e59bcea3e03f`
2. Build the image using Docker, named `registry.killer.sh:5000/sun-cipher`, tagged as `latest` and `v1-docker`, push these to the registry
3. Build the image using Podman, named `registry.killer.sh:5000/sun-cipher`, tagged as `v1-podman`, push it to the registry
4. Run a container using Podman, which keeps running in the background, named `sun-cipher` using image `registry.killer.sh:5000/sun-cipher:v1-podman`. Run the container from `k8s@terminal` and not `root@terminal`
5. Write the logs your container `sun-cipher` produced into `/opt/course/11/logs`. Then write a list of all running Podman containers into `/opt/course/11/containers`


## Question 12 | Storage, PV, PVC, Pod volume

_Task weight: 8%_

Create a new _PersistentVolume_ named `earth-project-earthflower-pv`. It should have a capacity of _2Gi_, accessMode _ReadWriteOnce_, hostPath `/Volumes/Data` and no storageClassName defined.

Next create a new _PersistentVolumeClaim_ in _Namespace_ `earth` named `earth-project-earthflower-pvc` . It should request _2Gi_ storage, accessMode _ReadWriteOnce_ and should not define a storageClassName. The _PVC_ should bound to the _PV_ correctly.

Finally create a new _Deployment_ `project-earthflower` in _Namespace_ `earth` which mounts that volume at `/tmp/project-data`. The _Pods_ of that _Deployment_ should be of image `httpd:2.4.41-alpine`.


## Question 13 | Storage, StorageClass, PVC

_Task weight: 6%_

Team Moonpie, which has the _Namespace_ `moon`, needs more storage. Create a new _PersistentVolumeClaim_ named `moon-pvc-126` in that namespace. This claim should use a new _StorageClass_ `moon-retain` with the _provisioner_ set to `moon-retainer` and the _reclaimPolicy_ set to _Retain_. The claim should request storage of _3Gi_, an _accessMode_ of _ReadWriteOnce_ and should use the new _StorageClass_.

The provisioner `moon-retainer` will be created by another team, so it's expected that the _PVC_ will not boot yet. Confirm this by writing the log message from the _PVC_ into file `/opt/course/13/pvc-126-reason`.


## Question 14 | Secret, Secret-Volume, Secret-Env

_Task weight: 4%_

You need to make changes on an existing _Pod_ in _Namespace_ `moon` called `secret-handler`. Create a new _Secret_ `secret1` which contains `user=test` and `pass=pwd`. The _Secret_'s content should be available in _Pod_ `secret-handler` as environment variables `SECRET1_USER` and `SECRET1_PASS`. The yaml for _Pod_ `secret-handler` is available at `/opt/course/14/secret-handler.yaml`.

There is existing yaml for another _Secret_ at `/opt/course/14/secret2.yaml`, create this _Secret_ and mount it inside the same _Pod_ at `/tmp/secret2`. Your changes should be saved under `/opt/course/14/secret-handler-new.yaml`. Both _Secrets_ should only be available in _Namespace_ `moon`.


# /opt/course/14/secret-handler-new.yaml


## Question 15 | ConfigMap, Configmap-Volume

_Task weight: 5%_

Team Moonpie has a nginx server _Deployment_ called `web-moon` in _Namespace_ `moon`. Someone started configuring it but it was never completed. To complete please create a _ConfigMap_ called `configmap-web-moon-html` containing the content of file `/opt/course/15/web-moon.html` under the data key-name `index.html`.

The _Deployment_ `web-moon` is already configured to work with this _ConfigMap_ and serve its content. Test the nginx configuration for example using `curl` from a temporary `nginx:alpine` _Pod_.


## Question 18 | Service misconfiguration

_Task weight: 4%_

There seems to be an issue in _Namespace_ `mars` where the ClusterIP service `manager-api-svc` should make the _Pods_ of _Deployment_ `manager-api-deployment` available inside the cluster.

You can test this with `curl manager-api-svc.mars:4444` from a temporary `nginx:alpine` _Pod_. Check for the misconfiguration and apply a fix.


## Question 19 | Service ClusterIP->NodePort

_Task weight: 3%_

In _Namespace_ `jupiter` you'll find an apache _Deployment_ (with one replica) named `jupiter-crew-deploy` and a ClusterIP _Service_ called `jupiter-crew-svc` which exposes it. Change this service to a NodePort one to make it available on all nodes on port 30100.

Test the NodePort _Service_ using the internal IP of all available nodes and the port 30100 using `curl`, you can reach the internal node IPs directly from your main terminal. On which nodes is the _Service_ reachable? On which node is the _Pod_ running?

## Question 20 | NetworkPolicy

_Task weight: 9%_

In _Namespace_ `venus` you'll find two _Deployments_ named `api` and `frontend`. Both _Deployments_ are exposed inside the cluster using _Services_. Create a _NetworkPolicy_ named `np1` which restricts outgoing tcp connections from _Deployment_ `frontend` and only allows those going to _Deployment_ `api`. Make sure the _NetworkPolicy_ still allows outgoing traffic on UDP/TCP ports 53 for DNS resolution.

Test using: `wget www.google.com` and `wget api:2222` from a _Pod_ of _Deployment_ `frontend`.


## Question 21 | Requests and Limits, ServiceAccount

_Task weight: 4%_

Team Neptune needs 3 _Pods_ of image `httpd:2.4-alpine`, create a _Deployment_ named `neptune-10ab` for this. The containers should be named `neptune-pod-10ab`. Each container should have a memory request of _20Mi_ and a memory limit of _50Mi_.

Team Neptune has it's own _ServiceAccount_ `neptune-sa-v2` under which the _Pods_ should run. The _Deployment_ should be in _Namespace_ `neptune`.


## Question 22 | Labels, Annotations

_Task weight: 3%_

Team Sunny needs to identify some of their _Pods_ in namespace `sun`. They ask you to add a new label `protected: true` to all _Pods_ with an existing label `type: worker` or `type: runner`. Also add an annotation `protected: do not delete this pod` to all _Pods_ having the new label `protected: true`.


# CKAD Simulator Preview Kubernetes 1.27

[https://killer.sh](https://killer.sh/)

This is a preview of the full CKAD Simulator course content.

The full course contains 22 questions and scenarios which cover all the CKAD areas. The course also provides a browser terminal which is a very close replica of the original one. This is great to get used and comfortable before the real exam. After the test session (120 minutes), or if you stop it early, you'll get access to all questions and their detailed solutions. You'll have 36 hours cluster access in total which means even after the session, once you have the solutions, you can still play around.

The following preview will give you an idea of what the full course will provide. These preview questions are not part of the 22 in the full course but in addition to it. But the preview questions are part of the same CKAD simulation environment which we setup for you, so with access to the full course you can solve these too.

The answers provided here assume that you did run the initial terminal setup suggestions as provided in the tips section, but especially:

alias k=kubectl

export do="--dry-run=client -o yaml"

**These questions can be solved in the test environment provided through the CKA Simulator**

## Preview Question 1

In _Namespace_ `pluto` there is a _Deployment_ named `project-23-api`. It has been working okay for a while but Team Pluto needs it to be more reliable. Implement a liveness-probe which checks the container to be reachable on port 80. Initially the probe should wait _10_, periodically _15_ seconds.

The original _Deployment_ yaml is available at `/opt/course/p1/project-23-api.yaml`. Save your changes at `/opt/course/p1/project-23-api-new.yaml` and apply the changes.



## Preview Question 2

Team Sun needs a new _Deployment_ named `sunny` with 4 replicas of image `nginx:1.17.3-alpine` in _Namespace_ `sun`. The _Deployment_ and its _Pods_ should use the existing _ServiceAccount_ `sa-sun-deploy`.

Expose the _Deployment_ internally using a ClusterIP _Service_ named `sun-srv` on port 9999. The nginx containers should run as default on port 80. The management of Team Sun would like to execute a command to check that all _Pods_ are running on occasion. Write that command into file `/opt/course/p2/sunny_status_command.sh`. The command should use `kubectl`.


