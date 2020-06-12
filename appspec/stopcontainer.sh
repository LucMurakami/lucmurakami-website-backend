#!/bin/bash
docker stop lucmurakami-website-backend
CID=$(docker ps -lq)
[ -n "$CID" ] && docker rm $CID
exit 0