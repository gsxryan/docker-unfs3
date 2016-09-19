# Rancher NFS Service

Quick container to throw up an nfs service for Rancher exported to the default managed network (10.42.0.0/16). Uses UNFS.

### Usage
#### Running the Docker Container
````
nfsservice:
  image: mitcdh/nfs-service-rancher
  volumes:
  - /sync/rancher-nfs:/rancher-nfs
````

### Structure
* `/rancher-nfs`: Directory exported over NFS

### Exposed Ports
* `111/udp 111/tcp 2049/tcp 2049/udp`: rpcbind and nfs server ports

### Credits
* [voobscout/unfs3](https://github.com/voobscout/unfs3)