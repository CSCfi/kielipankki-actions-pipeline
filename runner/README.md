# GitHub Actions Runner

## Development Instance
You need a personal access token for creating a local runner.

After that you can build and start a runner with
```
docker build . -t runnr
docker run runner [PAT]
```

### Cleanup old local containers
If you build and start multiple containers, there will be quite a lot of
rubbish. To get rid of all (NB: *all*, exercise caution if you use docker for
other purposes too) old containers and images, you can run
```
docker container prune
docker image prune
```
