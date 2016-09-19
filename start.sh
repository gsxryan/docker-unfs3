#!/bin/bash
# service rpcbind start

rpcbind
unfsd -d

inotifywait -rm /rancher-nfs
