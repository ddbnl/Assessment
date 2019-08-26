#!/bin/bash

prefix="sandwhich-sre"

if [[ $1 ]]; then
    prefix="$1"
fi


echo "Getting files"
git clone https://github.com/ddbnl/Assessment

echo "Building image '$prefix/assessment'"
docker build -t $prefix/assessment Assessment/task4-5/

echo "Running image '$prefix/assessment'"
docker run -p 8123:8123 --read-only --mount type=tmpfs,destination=/var/log/nginx,tmpfs-size=100000000 --mount type=tmpfs,destination=/var/lib/nginx,tmpfs-size=100000000 --mount type=tmpfs,destination=/var/cache/nginx,tmpfs-size=100000000 --mount type=tmpfs,destination=/tmp,tmpfs-size=100000000 $prefix/assessment
