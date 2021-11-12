#!/bin/bash

username=${1:-'admin'}
password=${2:-'123456'}
share_path=${3:`pwd`}

docker run -itd --restart=always \
    --name $username \
    -p 139:139 -p 445:445 \
    -v $share_path:/mount dperson/samba \
    -u "$username;$password" \
    -s "$username;/mount/;yes;no;yes;all;all;all" \
    -w "WORKGROUP" \
    -g "force user=$username" \
    -g "guest account=$username"
