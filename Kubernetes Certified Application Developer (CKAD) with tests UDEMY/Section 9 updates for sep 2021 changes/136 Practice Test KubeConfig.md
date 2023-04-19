I would like to use the `dev-user` to access `test-cluster-1`. Set the current context to the right one so I can do that.

Once the right context is identified, use the `kubectl config use-context` command.

> kubectl config --kubeconfig=/root/my-kube-config use-context research

We don't want to have to specify the kubeconfig file option on each command. Make the `my-kube-config` file the default kubeconfig.

