FROM ubuntu:22.04

ARG ACTIONS_RUNNER_VERSION="2.298.2"
ARG ACTIONS_RUNNER_CHECKSUM="0bfd792196ce0ec6f1c65d2a9ad00215b2926ef2c416b8d97615265194477117"

RUN apt-get update -y
RUN apt-get install curl libssl-dev libdigest-sha-perl jq python3 python3-pip -y

RUN ln -s /usr/bin/python3 /usr/bin/python

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
