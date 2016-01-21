#!/bin/bash
arr_join() {
    # $1 is return variable name
    # $2 is sep
    # $3... are the elements to join
    local retname=$1 sep=$2 ret=$3
    shift 3 || shift $(($#))
    printf -v "$retname" "%s" "$ret${@/#/$sep}"
}

# service rpcbind start
rpcbind
unfsd -d

declare -a mounts

while read name
do
    mounts+=${name%%" "*}" "
done < /etc/exports

arr_join watchable " " "${mounts[@]}"

inotifywait -rm ${watchable}
