# Kubectl Contexts

## View all and current context

> During the exam you'll be provided with a command you need to run before every question to switch into the correct kubectl context

A kubectl context contains connection information to a Kubernetes cluster. Different kubectl contexts can connect to different Kubernetes clusters, or to the same cluster but using different users or different default namespaces.

List all available kubectl contexts and write the output to `/root/contexts` .

  
Tip  

```plain
k config -h
```
  
Solution  

```plain
k config get-contexts
k config get-contexts > /root/contexts
```

  

We see three contexts all pointing to the same cluster.

Context `kubernetes-admin@kubernetes` will connect to the `default` _Namespace_.

Context `purple` will connect to the `purple` _Namespace_.

Context `yellow` will connect to the `yellow` _Namespace_.

  

CHECK
