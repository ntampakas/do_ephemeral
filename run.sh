#!/bin/sh

set -eux

EXIT_CODE=0

if [ "$1" = "schedule" ]; then
  droplets=$(doctl compute droplet list --format "Name,ID,Status" | grep off | awk '$1 ~ /^ntampakas-/ {print $2}')
  [ -z "$droplets" ] || doctl compute droplet delete $droplets -f
  exit 0
fi

doctl compute droplet create ntampakas-8 \
  --region "${REGION}" \
  --image "${IMAGE_NAME}" \
  --size s-1vcpu-1gb \
  --ssh-keys "${KEY_NAME}" \
  --user-data-file ./init.sh

exit "${EXIT_CODE}"
