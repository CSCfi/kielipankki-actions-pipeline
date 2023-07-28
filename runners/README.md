# GitHub Actions Runner

## Development Instance
You need a personal access token for creating a local runner. If you want to
create a test runner for pipelines in your personal repositories, you can use a
fine-grained token to the relevant repository or repositories. The following
permissions have been tested to be sufficient:

- Read: metadata and secrets
- Read and write:
  - actions
  - actions variables
  - administration
  - code
  - deployments
  - pages
  - workflows

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
