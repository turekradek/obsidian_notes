kubectl exec ubuntu-sleeper -- whoami


> Edit the pod `ubuntu-sleeper` to run the sleep process with user ID `1010`.


```POD_LEVEL
apiVersion: v1 
kind: Pod 
metadata: 
	name: ubuntu-sleeper 
	namespace: default 
spec: 
	securityContext: 
		runAsUser: 1010 
	containers: 
		- command: 
		- sleep 
		- "4800" 
	image: ubuntu 
	name: ubuntu-sleeper
```

```CONTAINER_LEVEL
apiVersion: v1 
kind: Pod 
metadata: 
	name: ubuntu-sleeper 
	namespace: default 
spec: 
	containers: 
		- command: 
		- sleep 
		- "4800" 
		image: ubuntu 
		name: ubuntu-sleeper
		securityContext: 
			runAsUser: 1010 
			capabilities:
				add: ["MAC_ADMIN"]
				
```

k exec -h
Execute a command in a container.

Examples:
  # Get output from running the 'date' command from pod mypod, using the first container by default
  kubectl exec mypod -- date
  
  # Get output from running the 'date' command in ruby-container from pod mypod
  kubectl exec mypod -c ruby-container -- date
  
  # Switch to raw terminal mode; sends stdin to 'bash' in ruby-container from pod mypod
  # and sends stdout/stderr from 'bash' back to the client
  kubectl exec mypod -c ruby-container -i -t -- bash -il
  
  # List contents of /usr from the first container of pod mypod and sort by modification time
  # If the command you want to execute in the pod has any flags in common (e.g. -i),
  # you must use two dashes (--) to separate your command's flags/arguments
  # Also note, do not surround your command and its flags/arguments with quotes
  # unless that is how you would execute it normally (i.e., do ls -t /usr, not "ls -t /usr")
  kubectl exec mypod -i -t -- ls -t /usr
  
  # Get output from running 'date' command from the first pod of the deployment mydeployment, using the first container
by default
  kubectl exec deploy/mydeployment -- date
  
  # Get output from running 'date' command from the first pod of the service myservice, using the first container by
default
  kubectl exec svc/myservice -- date

Options:
    -c, --container='':
        Container name. If omitted, use the kubectl.kubernetes.io/default-container annotation for selecting the
        container to be attached or the first container in the pod will be chosen

    -f, --filename=[]:
        to use to exec into the resource

    --pod-running-timeout=1m0s:
        The length of time (like 5s, 2m, or 3h, higher than zero) to wait until at least one pod is running

    -q, --quiet=false:
        Only print output from the remote session

    -i, --stdin=false:
        Pass stdin to the container

    -t, --tty=false:
        Stdin is a TTY

Usage:
  kubectl exec (POD | TYPE/NAME) [-c CONTAINER] [flags] -- COMMAND [args...] [options]

Use "kubectl options" for a list of global command-line options (applies to all commands).