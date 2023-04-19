*Recreate* - The recreate strategy is where a newer version is deployed by first destroying all of the existing versions, and then creating newer versions of application instances.

*Rolling Update* The second is the rolling update strategy where we do not destroy all of them at once. Instead, we take down the older version and bring up a newer version one by one. This way the application never goes down and the upgrade is seamless. (Default)

*Blue/Green* So the old version is called blue, and the new version is called green, and 100% of the traffic is still routed to the old version. So at this point in time, tests are run on the new version. And once all tests are passed, we switch traffic to the new version all at once. So that's the blue-green deployment strategy. Now these strategies are best implemented with service measures like Istio.

*Canary Updates* So the majority of traffic is being routed to the older version, but we have a small percentage routed to the new version. At this point, we run tests, and if everything looks good, we upgrade the original deployment with the newer version of the application. Say that could be done with a rolling upgrade strategy, for example, and then we get rid of the canary deployment.

- [ ] deployment primary
- [ ] old service
```service-definition.yaml
apiCerion: v1
kind: Service
metadata:
	name: my-service
spec:
	selector:
		app: front-end
```

- [ ] deployment canary
- [ ] deploy applications only few pods 
	- [ ] route traffic to both verions
	- [ ] route a small percentage of traffic to version 2
	For this, we create a common label. Let's call it App, which is set to front end, and we update the selector label in the service to match this common label. (route traffic to both verions)
	So how do we reduce the traffic to the canary deployment?
	We only want a small percentage of trafficto go to the canary deployment.We can do that by simply reducing the numberof pods in the canary deploymentto the minimum possible, in this case one.
```myapp-primary.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-primary
  labels:
    app: myapp
    type: front-end
spec:
  template:
    metadata:
	  name: myapp-pod
      labels:
        verion: v1
        app: myapp-pod
    spec:
      containers:
      - name: app-container
        image: myapp-image:1.0
  replicas: 5
  selector:
    matchLabels:
      app: front-end
```

```service-definition.yaml
apiVerion: v1
kind: Service
metadata:
	name: my-service
spec:
	selector:
		app: front-end
```

```myapp-canary.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-canary # changed
  labels:
    app: myapp
    type: front-end
spec:
  template:
    metadata:
	  name: myapp-pod
      labels:
        verion: v2 # changed
        app: myapp-pod
    spec:
      containers:
      - name: app-container
        image: myapp-image:2.0 # changed
  replicas: 1 # changed
  selector:
    matchLabels:
      app: front-end
```