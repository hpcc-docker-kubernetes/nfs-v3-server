#!/bin/bash
docker build -t hpccsystems/nfs-server:latest .

echo ""
echo "Push the image to Docker Hub"
echo "docker push hpccsystems/nfs-server:latest"
