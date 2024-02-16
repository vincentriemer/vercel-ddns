#!/usr/bin/env bash

set -euo pipefail

ENVS=`printenv | tr '\n' ' '`

echo "$VERCEL_TOKEN $DOMAIN_NAME $SUBDOMAIN" > /dev/null

env $ENVS bash /app/dns-sync.sh

echo "${CRON_SCHEDULE:=*/15 * * * *} env $ENVS bash /app/dns-sync.sh" > /var/spool/cron/crontabs/root

crond -f