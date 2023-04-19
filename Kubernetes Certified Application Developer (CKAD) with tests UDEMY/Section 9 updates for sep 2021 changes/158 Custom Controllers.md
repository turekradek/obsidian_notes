```
kind: Internal
apiVersion: datasets.kodekloud.com/v1
metadata:
  name: internal-space
  namespace: default
spec:
  internalLoad: "high"
  range: 80
  percentage: "50"
```

ETCD
Now, what we need to do is monitor the status of the objects in etcd and perform actions such as making calls to the flight booking API, to book, edit, or cancel flight tickets.

## Git repository Custom Controller
So how do you start building a custom controller? So there's a GitHub repo named sample controller. So first, 
 
- [ ] clone this repo and then we modify the controller.go with your custom code, then we build and run it.
- [ ] So make sure you have the Go programming language installed on your machine. Install it if it isn't already installed.
- [ ] And then clone the GitHub repo of the sample controller.
- [ ] We then CD into the sample controller directory and then we customize the controller.go with our custom logic.
```controller.go
package flightticket

var controllerKind *
apps.SchemeGroupVerion.WithKind("Flightticket")

//< Code hidden>

//Run begins watching and syncing.
func (dc *FlightTicketController) Run(workdrs int, stopCh <-chan struct{})

//< Code hidden>
//Call BookFlightAPIReplicaSet

func (dc *FlightTicketController) callBookFlightAPI(obj.?)
interface{})

```

> go build -o sample-controller .

- [ ] run it
> ./sample-controller -kubeconfg=$HOMR/.kube.config

Once your controller is ready, you can decide on how to distribute it. Now, you don't want to build and run it each time, so you may package the custom controller in a Docker image and then choose to run it inside your Kubernetes cluster as a pod or a deployment. That's a high level overview of building a custom controller.
