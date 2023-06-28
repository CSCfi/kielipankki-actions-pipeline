#!/bin/bash

HEADER="$(echo "Authorization: Bearer $1" | tr -d '\n')"

TOKEN_RESPONSE=$(wget --method=post -O- -q --header="Accept: application/vnd.github+json" --header="$HEADER" https://api.github.com/repos/CSCfi/kielipankki-nlf-harvester/actions/runners/registration-token)
TOKEN=$(echo $TOKEN_RESPONSE | jq --raw-output ".token")

./config.sh --url https://github.com/CSCfi/kielipankki-nlf-harvester --ephemeral --unattended --token $TOKEN
./run.sh
