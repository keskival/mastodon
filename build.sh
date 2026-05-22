#!/bin/bash
set -euo pipefail

DOCKER_BUILDKIT=1 docker build --build-arg UID=1000 --build-arg GID=1000 -t betanzos:32000/mastodon:latest --network host .
docker push betanzos:32000/mastodon:latest
microk8s ctr image pull --plain-http betanzos:32000/mastodon:latest
ssh betanzos -- microk8s ctr image pull --plain-http betanzos:32000/mastodon:latest
ssh arcones -- microk8s ctr image pull --plain-http betanzos:32000/mastodon:latest
ssh achucarro -- microk8s ctr image pull --plain-http betanzos:32000/mastodon:latest
ssh curie -- microk8s ctr image pull --plain-http betanzos:32000/mastodon:latest
ssh borge -- microk8s ctr image pull --plain-http betanzos:32000/mastodon:latest
