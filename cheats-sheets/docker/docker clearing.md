[Prune unused Docker objects | Docker Documentation](https://docs.docker.com/config/pruning/)


## Prune images[](https://docs.docker.com/config/pruning/#prune-images)

The `docker image prune` command allows you to clean up unused images. By default, `docker image prune` only cleans up _dangling_ images. A dangling image is one that is not tagged and is not referenced by any container. To remove dangling images:

```
$ docker image prune

WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
```

To remove all images which are not used by existing containers, use the `-a` flag:

```
$ docker image prune -a
```

```
docker image prune -a

WARNING! This will remove all images without at least one container associated to them.
Are you sure you want to continue? [y/N] y
```

## Prune containers[](https://docs.docker.com/config/pruning/#prune-containers)

When you stop a container, it is not automatically removed unless you started it with the `--rm` flag. To see all containers on the Docker host, including stopped containers, use `docker ps -a`. You may be surprised how many containers exist, especially on a development system! A stopped container’s writable layers still take up disk space. To clean this up, you can use the `docker container prune` command.

```
$ docker container prune

WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
```

By default, you are prompted to continue. To bypass the prompt, use the `-f` or `--force` flag.

By default, all stopped containers are removed. You can limit the scope using the `--filter` flag. For instance, the following command only removes stopped containers older than 24 hours:

```
$ docker container prune --filter "until=24h"
```

Other filtering expressions are available. See the [`docker container prune` reference](https://docs.docker.com/engine/reference/commandline/container_prune/) for more examples.

## Prune everything[](https://docs.docker.com/config/pruning/#prune-everything)

The `docker system prune` command is a shortcut that prunes images, containers, and networks. Volumes are not pruned by default, and you must specify the `--volumes` flag for `docker system prune` to prune volumes.

```
$ docker system prune

WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
```

To also prune volumes, add the `--volumes` flag:

```
$ docker system prune --volumes

WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
```

By default, you are prompted to continue. To bypass the prompt, use the `-f` or `--force` flag.
