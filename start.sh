#!/bin/bash

service rpcbind start
unfsd -d

exec inotifywait -rm /opt/exports
