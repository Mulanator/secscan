#!/bin/bash

readarray -t images < <(docker ps --format="{{.Image}}")
declare -p images
declare -a images

for i in "${images[@]}"
do
           docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v trivy_cache:/root/.cache/ aquasec/trivy image --timeout 1800m $i >> ./${i//\//_}.log
   done
