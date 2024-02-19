# Manual instrumentation for k8s and Node.js

## Requirements

- Minikube
- A running Instana agent

## Instructions

```bash
cd docker-base

docker build -t localhost:5000/my-nodejs-base-image .
docker push localhost:5000/my-nodejs-base-imag

cd ..

docker build -t localhost:5000:my-pod .
docker push localhost:5000:my-pod .

kubectrl apply -f ./pod.yaml
```

> kubectl logs my-app-6bb68445c4-ss8js

```
{"name":"@instana/collector","thread":0,"__in":1,"hostname":"my-app-6bb68445c4-ss8js","pid":1,"module":"pidStore","level":30,"msg":"Starting with pid 1","time":"2024-02-19T11:26:57.502Z","v":0}
{"name":"@instana/collector","thread":0,"__in":1,"hostname":"my-app-6bb68445c4-ss8js","pid":1,"module":"pidStore","level":20,"msg":"PID in sched file matches process.pid. Probably not running inside a PID namespace","time":"2024-02-19T11:26:57.508Z","v":0}
{"name":"@instana/collector","thread":0,"__in":1,"hostname":"my-app-6bb68445c4-ss8js","pid":1,"module":"index","level":30,"msg":"@instana/collector module version: 3.1.3","time":"2024-02-19T11:26:57.983Z","v":0}
{"name":"@instana/collector","thread":0,"__in":1,"hostname":"my-app-6bb68445c4-ss8js","pid":1,"module":"announceCycle","level":30,"msg":"Transitioning from <init> to agentHostLookup","time":"2024-02-19T11:26:58.000Z","v":0}
{"name":"@instana/collector","thread":0,"__in":1,"hostname":"my-app-6bb68445c4-ss8js","pid":1,"module":"index","level":20,"msg":"Attempt to load native add-on gcstats.js directly has been successful.","time":"2024-02-19T11:26:58.296Z","v":0}
{"name":"@instana/collector","thread":0,"__in":1,"hostname":"my-app-6bb68445c4-ss8js","pid":1,"module":"index","level":20,"msg":"Attempt to load native add-on event-loop-stats directly has been successful.","time":"2024-02-19T11:26:58.298Z","v":0}
```