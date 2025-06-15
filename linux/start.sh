#!/bin/bash
set -e

if [[ -z "$AZP_URL" || -z "$AZP_TOKEN" || -z "$AZP_AGENT_NAME" || -z "$AZP_POOL" ]]; then
  echo "One or more required environment variables are missing:"
  echo "AZP_URL, AZP_TOKEN, AZP_AGENT_NAME, AZP_POOL"
  exit 1
fi

# Cleanup previous config
./config.sh remove --unattended || true

./config.sh --unattended \
  --url "$AZP_URL" \
  --auth pat \
  --token "$AZP_TOKEN" \
  --pool "$AZP_POOL" \
  --agent "$AZP_AGENT_NAME" \
  --acceptTeeEula \
  --work _work

trap 'echo Shutting down...; ./config.sh remove --unattended' EXIT

./run.sh
