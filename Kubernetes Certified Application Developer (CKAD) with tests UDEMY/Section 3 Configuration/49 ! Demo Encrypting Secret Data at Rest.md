
kubectl get secret my-secret -o yaml

key1: 48h03gaq348hahf

> echo "48h03gaq348hahf" | base64
> secret

apt-get install etcd-client

ls /etc/kubernetes/pki/etcd

ETCDCTL_API=3 etcdctl \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/ca.crt \
--key=/etc/kubernetes/pki/etcd/ca.crt \
get /registry/secrets/default/secret1 | hexdump -C


# DO OBEJRZENIA JESZCZE RAZ 

[Encrypting Secret Data at Rest | Kubernetes](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/)


#encrypting
#DOCS

resources
	- resources:
		- secrets
		- providers:
			- identity: {}
			- aesgcm:
				 keys:
					 - name:
					    secret:
			- aecbc:
				  keys:
					 - name:
					    secret:
			- secretbox:
				 keys:
					 - name:
					    secret: