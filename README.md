# UNFS3 for Docker-Compose

Quick container to throw up an nfs service for inside a docker managed network with docker-compose installed. Uses UNFS3.  This has the advantage of running in User Space instead of Kernel space.  

CAP_SYS_ADMIN, --privileged, and AppArmor profiles are NOT required for this container.  This approach greatly mitigates the risk that IF the NFS container is exploited, can easily lead to full host machine takeover due to excessive permissions.  This reason is beneficial compared to the following NFS Kernel based docker containers.

* [ehough/docker-nfs-server](https://github.com/ehough/docker-nfs-server)
* [f-u-z-z-l-e/docker-nfs-server](https://github.com/f-u-z-z-l-e/docker-nfs-server)
* [sjiveson/nfs-server-alpine](https://github.com/sjiveson/nfs-server-alpine)

### Help Wanted

* UNFS4 - A user space enabled nfs server for NFS 4.2+. 
I've been unable to find a solution for this so far.  Is NFS-Ganesha adaptable for this purpose?

### Usage
#### Pull the repo
````
git clone https://github.com/gsxryan/docker-unfs3.git
````

#### Build the Docker container
````
docker build --rm --no-cache -t nfs-server .
````

#### Edit docker-compose.yml VOLUME host share path
````                                                        
version: "2"
services:
  nfs:
    image: nfs-server
    network_mode: bridge
    ports:
      - 111:111/tcp # rpcbind
      - 111:111/udp # rpcbind
      - 2049:2049/tcp #nfsd
      - 2049:2049/udp #nfsd
#mount the host volume for sharing
#Do NOT use /. or sensitive system paths
volumes:
      - /path/to/share:/export
    restart: unless-stopped
````

#### Running the Docker Container
````
docker compose up -d
````

#### Alternatively, use the docker RUN command
````
docker run -it -d --name unfs3_server -v /path/to/share:/export -p 111:111 -p 111:111/udp -p 2049:2049 -p 2049:2049/udp nfs-server
````

### Structure
* `/export`: Directory exported over NFS

### Exposed Ports
* `111/udp 111/tcp 2049/tcp 2049/udp`: rpcbind and nfs server ports

### Credits
* [mitcdh/unfs3](https://github.com/mitcdh/docker-unfs3)
