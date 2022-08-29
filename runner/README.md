# GitHub Actions Runner

## Development Instance
You can fetch the required token for a single-repository runner in github.com
by going to the repository > settings > actions > runners > new self hosted
runner > pick the token from the provided configuration command.

```
docker build . -t runnr
docker run runner [TOKEN]
```

### Cleanup old local containers
If you build and start multiple containers, there will be quite a lot of
rubbish. To get rid of all (NB: *all*, exercise caution if you use docker for
other purposes too) old containers and images, you can run
```
docker container prune
docker image prune
```
