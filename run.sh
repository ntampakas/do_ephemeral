#!/bin/sh

set -eux

EXIT_CODE=0

doctl compute droplet create ntampakas-8 \
  --region "${REGION}" \
  --image "${IMAGE_NAME}" \
  --size s-1vcpu-1gb \
  --ssh-keys "${KEY_NAME}" \
  --user-data-file ./init.sh

exit "${EXIT_CODE}"