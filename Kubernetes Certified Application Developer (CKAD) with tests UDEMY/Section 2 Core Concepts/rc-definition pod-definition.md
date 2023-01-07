
| rc-definition.yml | pod.yml|
| - | - |

 apiVersion: v1                                                     apiVersion: v1 
	kind: ReplicationController                              kind: Pod  
	  metadata:                                                       
		  name: myapp-rc                                          
		  labels:                                                          
			  app: myapp                                            
			  type: front-end                                           
spec:                                                                    
	template:                                                          
		<span style="color:blue">  metadata:  </span>                                                   <span style="color:green">metadata:</span>                                             
		  <span style="color:blue">  name: myapp-pod    </span>                                       <span style="color:green">name: myapp-pod</span>                                             
	     <span style="color:blue">_ labels:</span>                                                            <span style="color:green">labels:</span>
		   <span style="color:blue">_ app: myapp</span>                                                    <span style="color:green">app: myapp</span>
            <span style="color:blue">_ type: front-end</span>                                              <span style="color:green">type: frot-end</span>
		<span style="color:blue">    spec:</span>                                                           <span style="color:green"> spec:</span>
		  <span style="color:blue">  containers:</span>                                                     <span style="color:green">containers:</span>
	      <span style="color:blue">   - name: nginx-container</span>                                <span style="color:green">- name: nginx-container</span> 
	 	<span style="color:blue">    image: nginx</span>                                                  <span style="color:green">image: nginx    </span>     
replicas: 3 


 #REPLICATIONCONTROLLER
