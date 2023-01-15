

Ingress & Egress

1.  Ingress 80 <-- Website
    
2.  Egress 5000 --> Website
    
3.  Ingress 5000 <-- API
    
4.  Egress 3306 --> API
    
5.  Ingress 3306 <-- DBase
    

## 

Network Security

Network Policy

```
PodSelector:
   matchLabels:
       role: db
```

DBPod

```
labels:
    role: db
```

---

policyTypes:

-   Ingress ingress: Allow
-   from: Ingress
    -   podSelector: Traffic matchLabels: From name: api-pod API Pod ports: on
    -   protocol: TCP Port 3306 port: 3306

```
apiVerion: networking.
```