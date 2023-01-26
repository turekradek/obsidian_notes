## Accounts cluster
- [ ] Admins
- [ ] Developers
- [ ] Bots
~~kubectl create user user1
kubectl list users~~
> kubectl get serviceaccount

> kubectl create serviceaccount

## kube-apiserver authetnicate users , manage by kube-apiserver

- [ ] static password file
- [ ] static token file
- [ ] certificates
- [ ] identity services

user-details.csv
| static password file | static token file |
|-|-|
| password123,user1,u001||
|password123,user2,u002||

kube-aposerver.service
--basic-auth0file=user-details.csv
