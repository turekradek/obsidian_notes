```secret
DB_Host: host=
DB_User: user=
DB_Password: password
```

## staps to use secrets
- [ ] create secret 
- [ ] Inject into Pod


```imporative
kubectl create secret generic
	<secret-name> --from-literal=<key>=<value>
```

```
kubectl create secret generic \
	app-secret --from-literal=DB_Host=mysql
				--from-literal=DB_user=mysql
				--from-literal=DB_password=mysql
```

```from_file
kubectl create secret generic \
	app-secret --from-file=secret.properties
```

```imporative
kubectl create secret generic
	app-secret --from-file=app_secret.properties
```

```declarative
kubectl create -f 
```

secret_data_yaml
apiVersion: v1
kind: Secret
metadata:
	name: **app-secret**
data:
	DB_Host: fadfg # convertet format
	DB_User: roadfgadfot # echo -n 'user' | base64      TO ENCODE    echo -n 'asdfas' | base64 --decode
	DB_Password: adfgadf

apiVersion: v1
kind: Pod
metadata:
	name: simple-webapp-color
	labels:
		name: simple-webapp-color
spec:
	containersL
	- name: simple-webapp-color
	  image: simple-webapp-color
	  ports:
		  - containerPort: 8080
	  envFrom:
		  - secretRef:
		    name: **app-secret**
		

| [[def secret.yaml]] | definition secret |
| - | - |

>kubectl create -f secret-data.yaml

# CODING

> echo -n 'mysql' | base64
> fadfg

> echo -n 'root' | base64
> roadfgadfot

>echo -n 'passwrd' | base64
>adfgadf

> kubectl get secret app-secret -o yaml

```
apiVersion:
data:
	DB_Host: fadfg # convertet format
	DB_User: roadfgadfot
	DB_Password: adfgadf
kind: Secret
metadata:
	creationTimestamp: 2018-10-18
	labels:
		name: app-secret
	name: app-secret
	namespace: default
uid: 34523452-23456-23462-2356-2356-45
type: Opaque
```

# UNCODING

> echo -n 'fadfg' | base64 --decode
> mysql

> echo -n 'roadfgadfot' | base64 --decode
> root

> echo -n 'adfgadf' | base64 --decode
> passwrd

```pod_definition_secret
apiVersion: v1
kind: Pod
metadata:
	name: simple-webapp-color
	labels:
		name: simple-webapp-color
spec:
	containers:
	- name: simple-webapp-color
	  image: simple-webapp-color
	  ports:
		  - containerPort: 8080
	  envFrom:
		  - secretRef:
		    name: app-secret
```

>ENV
```
envFrom:
	- secretRef:
		  name: app-config
```

>SINGLE_ENV
```
env:
	- name: DB_Password
	  valueFrom:
		  secretKeyRef:
			  name: app-secret
			  key: DB_Password
```

>VOLUME
```
volumes:
- name: app-secret-v
  secret:
	  secretName: app-secret
```
ls /opt/app-secret-volumes
cat /opt/app-secret-volumes/DB_Password
paswrd

> Note on Secrets
- [x] Secrets are not Encrypted. Only oncoded.
	- [x] Do not check-in Secret objects to SCM along with code.
- [x] Secrets are not encrypted in ETCD
	- [ ] Enable encryption at rest
- [x] Anyone able to create pods/deployments in the same namespace can access the secrets
	- [ ] Configure least-provilege access to Secrets - RBAC
- [ ] Consider third-party secrets store providers AWS Provider, Azure Provider, GCP Provider, Vault Provider


```app.py
import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
	mysql.connector.connect(host='mysql', database-'mysql',
							user='root', password='paswrd')
	return render_template('hello.html', color=fetchcolor() )

if __name__ == "__main__":
	app.run(host="0.0.0.0", port="8080")
```
