# UNF3 for Docker

Quick container to throw up an nfs service for inside a docker managed network. Uses UNFS3.

Intended to provide an NFS share for convoy-nfs in Rancher.

### Usage
#### Running the Docker Container
````
nfsservice:
  image: mitcdh/unfs3
  volumes:
  - /sync/rancher-nfs:/export
````

### Structure
* `/export`: Directory exported over NFS

### Exposed Ports
* `111/udp 111/tcp 2049/tcp 2049/udp`: rpcbind and nfs server ports

### Credits
* [voobscout/unfs3](https://github.com/voobscout/unfs3)