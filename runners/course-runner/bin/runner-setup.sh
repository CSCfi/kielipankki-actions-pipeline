#!/bin/bash

HEADER="$(echo "Authorization: Bearer $1" | tr -d '\n')"

TOKEN_RESPONSE=$(wget --method=post -O- -q --header="Accept: application/vnd.github+json" --header="$HEADER" https://api.github.com/repos/$RUNNER_REPO/actions/runners/registration-token)
TOKEN=$(echo $TOKEN_RESPONSE | jq --raw-output ".token")

/home/kprunner/runner/config.sh --url https://github.com/$RUNNER_REPO --ephemeral --unattended --token $TOKEN
/home/kprunner/runner/run.sh
