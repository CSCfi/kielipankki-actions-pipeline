#!/bin/bash

HEADER="Authorization: Bearer $1"
TOKEN_RESPONSE=$(curl -X POST -H "Accept: application/vnd.github+json" -H "$HEADER" https://api.github.com/repos/CSCfi/kielipankki-nlf-harvester/actions/runners/registration-token)
TOKEN=$(echo $TOKEN_RESPONSE | jq --raw-output ".token")

./config.sh --url https://github.com/CSCfi/kielipankki-nlf-harvester --ephemeral --unattended --token $TOKEN
./run.sh
