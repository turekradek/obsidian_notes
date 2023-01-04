> docker run -d kodekloud/event-simulator 

-d means background 
> docker logs -f ecf 

kubectl crate -f event-simulatro.yaml
kubectl logs -f event-simulator -pod 

[[def pod.yaml]]

> kubectl logs -f event-simulator-pod event-simulator
>                  pod                  container  

inspect pod logs 
> kubectl logs webapp-1

error: a container name must be specified for pod name, choose one of: [simple-webapp db]
> kubectl logs webapp-2  simple-webapp

>kubectl top node

>kubectl top pod 
