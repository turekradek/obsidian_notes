|PV 1 | PV 2 | PV 3|
|-|-|-|
| PVC 1|PVC 2 | PVC3|

- [ ] Sufficient Capacity
- [ ] Access Modes
- [ ] Volumes MOdes
- [ ] Storage Class

```PVC
selector:
	matchLabels:
		name: my-pv
```
match to
```PV
labels:
	name: my-pv
```

[[def persistent volume]]
#persistent #persistentvolume
