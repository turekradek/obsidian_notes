## I strategy to deploy mysql (cluster) ....

| | MySQL mysql-master| |
|-|-|-|
| mysql-slave-1 | | mysql-slave-2|

- [ ] 1. Setup master first and then slaves
- [ ] 2. Clone data from the master to slave-1
- [ ] 3. Enable continuos raplication from master to slave-1
- [ ] 4. Wait for slave-1 to be ready
- [ ] 5. Clone data from slave-1 to slave-2
- [ ] 6. Enable continuous replication from master to slave-2
- [ ] 7. Configure Master Address on Slave

## DEPLOYMENT

| | MySQL mysql-master| |
|-|-|-|
| mysql-slave-1 | MySQL mysql-master | mysql-slave-2|

- [ ] 1. ~~Setup master first and then slaves
- [x] 2. Clone data from the master to slave-1
- [x] 3. Enable continuos raplication from master to slave-1
- [ ] 4. ~~Wait for slave-1 to be ready
- [x] 5. Clone data from slave-1 to slave-2
- [x] 6. Enable continuous replication from master to slave-2
- [x] 7. Configure Master Address on Slave


## STATEFUL SETS
With stateful sets,
PODs are created in a sequential order.
After the first POD is deployed,
it must be in a running
and ready state before the next POD is deployed. IT HELPS IN STEPS 1 AND 4
NO RANDOM NAMES FOR POD BECEAUSE OF THIS

| | MySQL mysql-master| |
|-|-|-|
| mysql-slave-1 | MySQL mysql-master | mysql-slave-2|

- [x] 1. Setup master first and then slaves
- [ ] 2. Clone data from the master to slave-1
- [ ] 3. Enable continuos raplication from master to slave-1
- [x] 4. Wait for slave-1 to be ready
- [ ] 5. Clone data from slave-1 to slave-2
- [ ] 6. Enable continuous replication from master to slave-2
- [ ] 7. Configure Master Address on Slave
To enable continuous replication,
you can now point the slaves
to the master at MySQL dash zero.
Even if the master fails and the POD is recreated,
it would still come up with the same name.
Stateful sets maintain a sticky identity
for each of their PODs,
and these help with the remaining steps.
The master is now always the master
and available at the address MySQL dash zero.
And that is why you need stateful sets.

