#!/bin/bash

# service rpcbind start
rpcbind
unfsd -d

declare -a mounts

while read name
do
    mounts+=${name%%" "*}" "
done < /etc/exports

eval "inotifywait -rm ${mounts}"
