## Deployment Controller
proces that controll deployment process
Custom Resource
```flighttivket.yaml
apiVersion: flights.com/v1
kind: FlightTicket
metadata:
  name: my-flight-ticket
spec:
  from: Warsaw
  to: London
  number: 2
```
>kubectl create -f flighticket.yml

- [ ] creacte Custom Resource Definition (CRD)

```flightticket-custom-definition.yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResoruceDefinition
metadata:
  name: flighttickets.flights.com
spec:
  scope: Namespaced
  goup: flights.com
  names:
	  kind: FlightTicket
	  singular: flightticket
	  plural: flighttickets # that name return kubectl api-resources
	  shortNames:
		  - ft
  verions:
	  - name: v1
	    served: true
	    storage: true
  schema:
	  openAPIV3Schema:
		  type: object
		  properties:
			  spec:
				  type: object
				  properties:
					  form:
						  type: string
					  to:
						  type: string
					  number:
						  type: integet
						  minimum: 1
						  maximum: 10
						  
```
> kubectl api-resources

return  
NAME            SHORNAMES     APIGROU       NAMESPACED    KIND
flighttickets      ft         flights.com     true        FlightTicket

> kubectl get ft 

NAME              AGE
my-flight-ticket  24m

> kubectl create -f flightticket-custom-definition.yml

now after created Custom Resource Definition flightticket-custom-definition.yaml can you 
>kubectl create -f flighticket.yml

>kubectl get flighticket

> kubectl delete -f flightticket.uml
