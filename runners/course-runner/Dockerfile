FROM ubuntu:22.04

# Basic setup

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install curl wget libssl-dev libdigest-sha-perl jq build-essential libssl-dev uuid-dev libgpgme11-dev squashfs-tools libseccomp-dev pkg-config -y

RUN export LANG=fi_FI.utf8
RUN export LC_ALL=fi_FI.utf8

# GitHub actions runner

ARG ACTIONS_RUNNER_VERSION="2.306.0"
ARG ACTIONS_RUNNER_CHECKSUM="b0a090336f0d0a439dac7505475a1fb822f61bbb36420c7b3b3fe6b1bdc4dbaa"

RUN useradd --home-dir /home/kprunner --create-home --no-log-init -u 1031660001 kprunner
USER kprunner

RUN mkdir /home/kprunner/runner
WORKDIR /home/kprunner/runner

RUN curl -o "actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" -L "https://github.com/actions/runner/releases/download/v$ACTIONS_RUNNER_VERSION/actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"
RUN echo "$ACTIONS_RUNNER_CHECKSUM  actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz" | shasum -a 256 -c
RUN tar xzf "./actions-runner-linux-x64-$ACTIONS_RUNNER_VERSION.tar.gz"

ADD bin /home/kprunner/

USER root
RUN /home/kprunner/runner/bin/installdependencies.sh

RUN apt-get install python3-pip pandoc python3-pandocfilters fonts-noto fonts-inconsolata git cabal-install nvi -y

RUN cabal update
RUN mkdir -p /root/.cabal/bin
RUN cabal install pandoc-types-1.17.5.4 pandoc-emphasize-code

RUN ln -s /usr/bin/python3 /usr/bin/python

USER kprunner
WORKDIR /home/kprunner

RUN git clone https://github.com/csc-training/slide-template
WORKDIR /home/kprunner/slide-template
RUN make git
ENV PATH="$PATH:/home/kprunner/lib/slidefactory"

USER kprunner
WORKDIR /home/kprunner
ENTRYPOINT ["/bin/bash", "/home/kprunner/runner-setup.sh"]
