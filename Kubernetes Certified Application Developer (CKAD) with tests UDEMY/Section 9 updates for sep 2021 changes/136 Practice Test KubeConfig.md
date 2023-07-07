#config #configmap #context #configview

I would like to use the `dev-user` to access `test-cluster-1`. Set the current context to the right one so I can do that.

Once the right context is identified, use the `kubectl config use-context` command.

> kubectl config --kubeconfig=/root/my-kube-config use-context research

We don't want to have to specify the kubeconfig file option on each command. Make the `my-kube-config` file the default kubeconfig.

> kubectl config .........

/root/.kube/config
k config -h
Modify kubeconfig files using subcommands like "kubectl config set current-context my-context"

 The loading order follows these rules:

  1.  If the --kubeconfig flag is set, then only that file is loaded. The flag may only be set once and no merging takes
place.
  2.  If $KUBECONFIG environment variable is set, then it is used as a list of paths (normal path delimiting rules for
your system). These paths are merged. When a value is modified, it is modified in the file that defines the stanza. When
a value is created, it is created in the first file that exists. If no files in the chain exist, then it creates the
last file in the list.
  3.  Otherwise, ${HOME}/.kube/config is used and no merging takes place.

Available Commands:
  current-context   Display the current-context
  delete-cluster    Delete the specified cluster from the kubeconfig
  delete-context    Delete the specified context from the kubeconfig
  delete-user       Delete the specified user from the kubeconfig
  get-clusters      Display clusters defined in the kubeconfig
  get-contexts      Describe one or many contexts
  get-users         Display users defined in the kubeconfig
  rename-context    Rename a context from the kubeconfig file
  set               Set an individual value in a kubeconfig file
  set-cluster       Set a cluster entry in kubeconfig
  set-context       Set a context entry in kubeconfig
  set-credentials   Set a user entry in kubeconfig
  unset             Unset an individual value in a kubeconfig file
  use-context       Set the current-context in a kubeconfig file
  view              Display merged kubeconfig settings or a specified kubeconfig file

Usage:
  kubectl config SUBCOMMAND [options]

Use "kubectl <command> --help" for more information about a given command.
Use "kubectl options" for a list of global command-line options (applies to all commands).

12. I would like to use the `dev-user` to access `test-cluster-1`. Set the current context to the right one so I can do that.

Once the right context is identified, use the `kubectl config use-context` command.
 To use that context, run the command: 
 >`kubectl config --kubeconfig=/root/my-kube-config use-context research`  

 To know the current context, run the command: 
  > `kubectl config --kubeconfig=/root/my-kube-config current-context`

`kubectl config --kubeconfig=/root/my-kube-config use-context research`
- name: research
  context:
    cluster: test-cluster-1
    user: dev-user

13. We don't want to have to specify the kubeconfig file option on each command. Make the `my-kube-config` file the default kubeconfig.
	Replace the contents in the `default` kubeconfig file with the content from `my-kube-config` file.

14. With the current-context set to `research`, we are trying to access the cluster. However something seems to be wrong. Identify and fix the issue.
	Try running the `kubectl get pods` command and look for the error. All users certificates are stored at `/etc/kubernetes/pki/users`.

users:
- name: aws=user
	-  client-certificate: etc/kubernetes/pki/users/aws-user/aws-user.crt
	- client-key: /etc/kubernetes/pki/users/aws-user/aws-user.key
- name: dev-user
- user:
	- client-certificate: /etc/kubernetes/pki/users/dev-user/ <span style="color:yellow">developer-user.crt</span>
	- client-key: /etc/kubernetes/pki/users/dev-user/dev-user.key

> ls /etc/kubernetes/pki/users

	aws-user dev-user test-user

> ls /etc/kubernetes/pki/users/dev-user/

dev0yser.crt dev-user.csr dev-user.key


