FROM centos:7

ARG ACTIONS_RUNNER_VERSION="2.295.0"

RUN yum install epel-release -y
RUN yum update -y
RUN yum install perl-Digest-SHA jq python3 pip3 -y

RUN useradd --no-log-init -u 1031660001 kprunner

USER kprunner

WORKDIR /home/kprunner
ADD bin .

RUN curl -o "actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" -L "https://github.com/actions/runner/releases/download/v$ACTIONS_RUNNER_VERSION/actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"
RUN echo "a80c1ab58be3cd4920ac2e51948723af33c2248b434a8a20bd9b3891ca4000b6  actions-runner-linux-x64-2.295.0.tar.gz" | shasum -a 256 -c
RUN tar xzf "./actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"

USER root
RUN ./bin/installdependencies.sh

USER kprunner
ENTRYPOINT ["/bin/bash", "runner-setup.sh"]
