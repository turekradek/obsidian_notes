
dodker run --name ubuntu-sleeper ubuntu-sleeper 10

pod-definition.yml

```pod_definition_yml
apiVersion: v1
kind: Pod
metadata:
	name: ubuntu-sleeper-pod
spec:
	containers:
		- name: ubuntu-sleeper
		   image: ubuntu-sleeper
		   command: ["sleep2.0"] # OVERWRITE ENTRYPOINT IN DF
		   args: ["10"] # OVERWRITE CMD IN DOCKERFILE
```

```Dockerfile
FROM ubuntu
ENTRYPOINT ["sleep"]
CMD ["5"]
```
TO OVERWRITE ENTRYPOINT
#ENTRYPOINT
>docker run --name ubuntu-sleeper \
>		--entrypoint sleep2.0 ubuntu-sleeper 10

| dockerfile | pod definition yml|
|-|-|
| ENTRYPOINT ["sleep"] | command: ["sleep2.0"] |
| CMD ["5"] | args: ["10"] |

kubectl run webapp --image=nginx --command  -- python app2.py --color green