FROM ubuntu:22.04

ARG ACTIONS_RUNNER_VERSION="2.311.0"
ARG ACTIONS_RUNNER_CHECKSUM="29fc8cf2dab4c195bb147384e7e2c94cfd4d4022c793b346a6175435265aa278"

RUN export LANG=fi_FI.utf8
RUN export LC_ALL=fi_FI.utf8

# Basic prerequisites

USER root

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install curl wget libssl-dev libdigest-sha-perl jq -y

RUN useradd --home-dir /home/kprunner --create-home --no-log-init -u 1031660001 kprunner


# Runner software

USER kprunner
RUN mkdir /home/kprunner/runner
WORKDIR /home/kprunner/runner
ADD bin .

RUN curl \
  -o "actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" \
  -L "https://github.com/actions/runner/releases/download/v$ACTIONS_RUNNER_VERSION/actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"
RUN echo "$ACTIONS_RUNNER_CHECKSUM  actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" | shasum -a 256 -c
RUN tar xzf "./actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"

USER root
RUN ./bin/installdependencies.sh


# Python

RUN apt-get install software-properties-common -y \
  && add-apt-repository ppa:deadsnakes/ppa -y \
  && apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive TZ=Europe/Helsinki apt-get install python3.8 python3.8-distutils pip -y \
  && pip install --upgrade pip


# Start runner when running the container

USER kprunner
WORKDIR /home/kprunner
ENTRYPOINT ["/bin/bash", "/home/kprunner/runner/runner-setup.sh"]
