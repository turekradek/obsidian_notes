*Recreate* - The recreate strategy is where a newer version is deployed by first destroying all of the existing versions, and then creating newer versions of application instances.

*Rolling Update* The second is the rolling update strategy where we do not destroy all of them at once. Instead, we take down the older version and bring up a newer version one by one. This way the application never goes down and the upgrade is seamless. (Default)

*Blue/Green* So the old version is called blue, and the new version is called green, and 100% of the traffic is still routed to the old version. So at this point in time, tests are run on the new version. And once all tests are passed, we switch traffic to the new version all at once. So that's the blue-green deployment strategy. Now these strategies are best implemented with service measures like Istio.

- [ ] deployment blue
- [ ] old service
```service-definition.yaml
apiCerion: v1
kind: Service
metadata:
	name: my-service
spec:
	selector:
		verion: v1
```

- [ ] deployment green
- [ ] deploy applications
- [ ] change service version
```service-definition.yaml
apiCerion: v1
kind: Service
metadata:
	name: my-service
spec:
	selector:
		verion: v2
```
