#!/bin/bash

# Handle `docker stop` for graceful shutdown
#---------------------------------------------
function shutdown {
    echo "- Shutting down nfs-server.."
    service nfs-kernel-server stop
    echo "- Nfs server is down"
    exit 0
}

trap "shutdown" SIGTERM


# prepare /etc/exports
#---------------------------------------------
for i in "$@"; do
   # fsid=0: needed for NFSv4
   echo "$i *(rw,sync,insecure,no_subtree_check,no_root_squash)" >> /etc/exports
   #echo "$i *(rw,fsid=0,insecure,no_root_squash,no_subtree_check)" >> /etc/exports
   echo "Serving $i"
done


# Start NFS
#---------------------------------------------
echo -e "\n- Initializing nfs server.."
rpcbind
service nfs-kernel-server start

echo "- NFS server is up and running.."

## Run until signaled to stop...
#---------------------------------------------
while :
do
    sleep 5  # Interupt interval time
done
