# NFS Service

Quick container to throw up an nfs service for inside a docker managed network. Uses UNFS3.

### Usage
#### Running the Docker Container
````
nfsservice:
  image: mitcdh/nfs-service
  volumes:
  - /sync/rancher-nfs:/rancher-nfs
````

### Structure
* `/export`: Directory exported over NFS

### Exposed Ports
* `111/udp 111/tcp 2049/tcp 2049/udp`: rpcbind and nfs server ports

### Credits
* [voobscout/unfs3](https://github.com/voobscout/unfs3)