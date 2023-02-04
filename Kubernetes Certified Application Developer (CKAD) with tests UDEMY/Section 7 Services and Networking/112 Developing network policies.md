[[def network poliecies]]
   80
   Web
   pod -----------------50000 API
     /                 / 
       /             /
	  \  /         / 
	    \ DB 3306
		  Pod

## this code below protect DB Pod [[def network poliecies]]
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
	name: db-policy
	namespace: prod
spec
	__<span style="color:green">PodSelector</span>
   ___<span style="color:green"> __        matchLabels:</span>
	   <span style="color:green">   ______    role: db</span> # DB Pod
	**policyTypes:
	   - Ingress # WCHODZACE
	ingress:
	- from: 
	   -   podSelector:                                                                 -   podSelector:            
			matchLabels:                                                                      matchLabels: 
				name: api-pod                                                                   name: api-pod 
		   ####################
           namespaceSelector:           # DEFAULT NAMESPACE IS prod                     -   namespaceSelector:      - MEADN ANOTHER BLOCK 
	           matchLabels:              # BUT THIS CODE ALLOWD FOR staging TOO                matchLabels:           namespace WITHOUT - MEANS
		           name: staging         # BUT ONLY FOR API Pod                                    name: staging         podSelector &&  namespace
		   #####################
		- ipBlock:                      BACKUP
			 cicdr: 192.168.5.10/32      SERVER OUTSIDE CLUSTER                            ABOVE 2 DIFFERENT BLOCKS 
		  #######################
			ports: 
		    -   protocol: TCP 
			    port: 3306   

THIS CODE ABOVE BLOCKS ALL TRAFFICS EXEPT API Pod ON PORT 3306
--------
So when deciding on what type of rule is to be created,
you only need to be concerned about the direction
in which the request originates,
which is denoted by the straight line here,
and you don't need to worry about the response,
which is denoted by the dotted line.

        -----------------------                      |    SOME BACKUP SERVER OUTSIDE CLUSTER
API Pod                        DB Pod           |    192.168.5.10
        . . . . . . . . . . .                   |

# Egress role for backup

kind: NetworkPolicy
metadata:
	name: db-policy
	namespace: prod
spec
	__<span style="color:green">PodSelector</span>
   ___<span style="color:green"> __        matchLabels:</span>
	   <span style="color:green">   ______    role: db</span> # DB Pod
	**policyTypes:
	   - Ingress # WCHODZACE
	   - Egress
	ingress:
	 - from: 
	   -   podSelector:                         
			matchLabels:              
				name: api-pod           
	  ports: 
	  -   protocol: TCP 
	      port: 3306   
	egress:
	- to:
	  - ipBlock:
		    cidr: 192.168.5.10/32
	  ports: 
	  - protocol: TCP 
	    port: 80
	  