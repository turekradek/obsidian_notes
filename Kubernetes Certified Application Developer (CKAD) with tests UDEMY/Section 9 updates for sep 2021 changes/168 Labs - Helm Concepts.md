Add a `bitnami` helm chart repository in the `controlplane` node.

name - `bitnami`  
chart repo name - `https://charts.bitnami.com/bitnami` 
>helm repo add bitnami https://charts.bitnami.com/bitnami

helm search repo joomla
---
How many `helm` repositories are added in the `controlplane` node?
Run the command: `helm repo list`
---
Install `drupal` helm chart from the `bitnami` repository. Release name should be `bravo`.  Chart name should be `bitnami/drupal`. **Note:** Ignore the state of the application now.

Run the command: `helm install bravo bitnami/drupal` and after that run the `helm list` command to verify it's installation.
---

Uninstall the `drupal` helm package which we installed earlier.
```
ontrolplane ~ ✖ helm list
NAME    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
bravo   default         1               2023-02-05 08:59:02.225230815 -0500 EST deployed        drupal-13.0.2   10.0.3     

controlplane ~ ➜  helm uninstall drupal-13.0.2
Error: uninstall: Release not loaded: drupal-13.0.2: release: not found

controlplane ~ ✖ helm uninstall bravo
release "bravo" uninstalled
```

Download the `bitnami apache` package under the `/root` directory. **Note:** Do not install the package. Just download it.
>Run the command : `helm pull --untar bitnami/apache`


Inspect the file `values.yaml` and make changes so that 2 replicas of the webserver are running and the `http` is exposed on nodeport `30080`. **Note:** You can read the Bitnami documentation for more.  
`https://github.com/bitnami/charts/tree/master/bitnami/apache/#installing-the-chart`


nstall the `apache` from the downloaded `helm` package.  
Release name: `mywebapp` **Note:** Do make changes accordingly so that 2 replicas of the webserver are running and the `http` is exposed on nodeport `30080`. Make sure that the pods are in the running state.

 helm install release2 ./apache
```
ontrolplane ~ ➜  helm install mywebapp ./apache
Error: INSTALLATION FAILED: Service "mywebapp-apache" is invalid: spec.ports[0].nodePort: Invalid value: 30080: provided port is already allocated

controlplane ~ ✖ helm list
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
mywebapp        default         1               2023-02-05 09:18:15.517858883 -0500 EST failed          apache-9.2.15   2.4.55     
release-3       default         1               2023-02-05 09:17:37.021415382 -0500 EST deployed        apache-9.2.15   2.4.55     
release2        default         1               2023-02-05 09:08:28.41052796 -0500 EST  deployed        apache-9.2.15   2.4.55     

controlplane ~ ➜  helm uninstall release-3
release "release-3" uninstalled

controlplane ~ ➜  helm uninstall release2
release "release2" uninstalled

controlplane ~ ➜  helm uninstall mywebapp
release "mywebapp" uninstalled

controlplane ~ ➜  helm install mywebapp ./apache
```