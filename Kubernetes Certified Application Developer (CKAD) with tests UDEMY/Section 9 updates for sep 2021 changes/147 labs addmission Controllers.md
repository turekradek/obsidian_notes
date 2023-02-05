Which admission controller is not enabled by default?
Check `enable-admission-plugins` in `kube-apiserver` help options


```
kubectl exec -it kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep 'enable-admission-plugins'
```

  
Which admission controller is enabled in this cluster which is normally disabled?


grep enable-admission-plugins /etc/kubernetes/manifests/kube-apiserver.yaml

The previous step failed because kubernetes have `NamespaceExists` admission controller enabled which rejects requests to namespaces that do not exist. So, to create a namespace that does not exist automatically, we could enable the `NamespaceAutoProvision` admission controller

Enable the `NamespaceAutoProvision` admission controller

_Note:_ Once you update `kube-apiserver yaml` file, please wait for a few minutes for the `kube-apiserver` to restart completely.

Edit `/etc/kubernetes/manifests/kube-apiserver.yaml` and add `NamespaceAutoProvision` admission controller to `--enable-admission-plugins` list

Add `NamespaceAutoProvision` admission controller to `--enable-admission-plugins` list to `/etc/kubernetes/manifests/kube-apiserver.yaml` It should look like below

```
    - --enable-admission-plugins=NodeRestriction,NamespaceAutoProvision
```

Since the `kube-apiserver` is running as pod you can check the process to see enabled and disabled plugins.

>ps -ef | grep kube-apiserver | grep admission-plugins