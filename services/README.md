# Runner Service on Rahti

## Debugging
You can check what pods are running with
```
oc get pods
```
and then get logs for a specific pod:
```
oc logs [POD NAME]
```
Logs from the previous run can be accessed by using the `--previous` flag.
