# GitHub Actions Runner

## Development Instance
You need a personal access token for creating a local runner.

After that you can navigate to the desired runner's directory and build and
start it with
```
docker build . -t [runner-name]   # runner-name can be e.g. "python-runner"
docker run --env RUNNER_REPO='[organization/repository]' python-runner [PAT]
```

### Cleanup old local containers
If you build and start multiple containers, there will be quite a lot of
rubbish. To get rid of all (NB: *all*, exercise caution if you use docker for
other purposes too) old containers and images, you can run
```
docker container prune
docker image prune
```
