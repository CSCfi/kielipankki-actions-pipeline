#!/bin/bash

export RUNNER_ALLOW_RUNASROOT="1"
./config.sh --url https://github.com/CSCfi/kielipankki-nlf-harvester --token $1
./run.sh
