FROM ubuntu:22.04

ARG ACTIONS_RUNNER_VERSION="2.304.0"
ARG ACTIONS_RUNNER_CHECKSUM="292e8770bdeafca135c2c06cd5426f9dda49a775568f45fcc25cc2b576afc12f"

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update -y
RUN apt-get install curl wget libssl-dev libdigest-sha-perl jq -y
RUN DEBIAN_FRONTEND=noninteractive TZ=Europe/Helsinki apt-get install python3.8 python3.8-distutils pip -y

RUN pip install --upgrade pip

RUN useradd --home-dir /home/kprunner --create-home --no-log-init -u 1031660001 kprunner

USER kprunner

WORKDIR /home/kprunner
ADD bin .

RUN curl -o "actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" -L "https://github.com/actions/runner/releases/download/v$ACTIONS_RUNNER_VERSION/actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"
RUN echo "$ACTIONS_RUNNER_CHECKSUM  actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" | shasum -a 256 -c
RUN tar xzf "./actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"

USER root
RUN ./bin/installdependencies.sh

USER kprunner

RUN export LANG=fi_FI.utf8
RUN export LC_ALL=fi_FI.utf8

ENTRYPOINT ["/bin/bash", "runner-setup.sh"]
