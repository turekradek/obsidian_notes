
- [ ] docker run ubuntu 
- [ ] docker ps          empty
- [ ] docker ps -a    shows container
- [ ] docker run ubuntu [COMMAND]
- [ ] docker run ubuntu sleep 5
	- [ ] FROM Ubuntu
	- [ ] CMD sleep 5
- [ ] CMD command param1 
- [ ] CMD ['command', 'param1']
- [ ] CMD sleep 5
- [ ] CMD ['sleep','5']
- [x] CMD ['sleep 5']

permanently change sleep 10
- [ ] docker run ubuntu-sleeper sleep 10

command at startup: sleep 10
NO DEFAULT PARAM 
FROM Ubuntu                                docker run ubuntu-sleeper 10
ENTRYPOINT ['sleep']
													['sleep']    10
													     |          |
					Command at Startup: sleep 10 

MODIFICATION OF PARAMS DEFAULT PARAM 

FROM Ubuntu                                docker run ubuntu-sleeper INTEGER 
ENTRYPOINT ['sleep']
CMD ['5']