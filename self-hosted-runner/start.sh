# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

#!/bin/bash

set -euo pipefail  # Ensures the script will fail for unbound variables/errors

# Validate required variables are set
if [[ -z "${REPO:-}" || -z "${REG_TOKEN:-}" || -z "${NAME:-}" ]]; then
  echo "Error: REPO, REG_TOKEN, and NAME must all be set." >&2
  exit 1
fi

cd /home/runner/actions-runner || exit

# Check if runner is already configured
if [[ -f "config.json" ]]; then
    echo "Runner configuration exists. No action needed."
else
    # Configure the self-hosted runner
    ./config.sh --unattended --url "https://github.com/${REPO}" --token "${REG_TOKEN}" --name "${NAME}"
fi

cleanup() {
  echo "Cleaning up runner..."
  ./config.sh remove --unattended --token "${REG_TOKEN}"
  unset REG_TOKEN  # Clear the sensitive token after use
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

unset REG_TOKEN  # Clear the sensitive token before starting the runner
./run.sh & wait $!