## Accounts cluster
- [ ] Admins
- [ ] Developers
- [ ] Bots

> kubectl create serviceaccount

## kube-apiserver authetnicate users

- [ ] static password file
- [ ] static token file
- [ ] certificates
- [ ] identity services

| static password file | static token file |
|-|-|
| password123,user1,u001||
|password123,user2,u002||

kube-aposerver.service
--basic-auth0file=user-details.csv
