[Portainer](https://www.portainer.io/ "https://www.portainer.io/") can be used as a replacement for Docker Desktop in terms of GUI for managing containers, images etc.

1.  With this snippet the proper volume will be created, and the Portainer container will be run exposing the GUI on port 9000 (HTTTP connection is used not to mess with HTTPS certificates). It will also start Portainer automatically as the Docker service is launched.
    
   ```
 docker volume create portainer_data
 
    docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
    
2.  When the container is running, type `localhost:9000` in your browser to access the Portainer GUI. During the first run you will need to set up an admin account and connect Portainer to your local Docker instance

## Resetting Admin password in Portainer running as container

1- Firstly, we will stop the Portainer container.

```
docker container stop portainer
```

2- We will run the helper using the same bind-mount/volume for the data volume

```
docker run --rm -v portainer_data:/data portainer/helper-reset-password
```

The response should be similar to the below.

```
2020/06/04 00:13:58 Password succesfully updated for user: admin
2020/06/04 00:13:58 Use the following password to login: &_4#\3^5V8vLTd)E"NWiJBs26G*9HPl1
```

3- Finally, we will restart the Portainer container.

```
docker container start portainer
```