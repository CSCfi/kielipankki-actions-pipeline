FROM centos:7

ARG ACTIONS_RUNNER_VERSION="2.296.2"
ARG ACTIONS_RUNNER_CHECKSUM="34a8f34956cdacd2156d4c658cce8dd54c5aef316a16bbbc95eb3ca4fd76429a"

RUN yum install epel-release -y
RUN yum update -y
RUN yum install perl-Digest-SHA jq python3 pip3 -y

RUN useradd --no-log-init -u 1031660001 kprunner

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
