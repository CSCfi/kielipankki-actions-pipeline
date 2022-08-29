FROM centos:7

WORKDIR /usr/src/actions-runner
ADD bin .
RUN ./runner-requirements.sh
ENTRYPOINT ["./runner-setup.sh"]
