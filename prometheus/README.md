# Prometheus

## PromQL
Prometheus provides a functional query language called PromQL (Prometheus Query Language) that lets the user select and aggregate time series data in real time. The result of an expression can either be shown as a graph, viewed as tabular data in Prometheus's expression browser, or consumed by external systems via the HTTP API.

### Examples
```sh
# list all instance health status
up

# filtering
up{namespace="mynamespace"}

# contains
node_filesystem_size_bytes{device=~"/dev/sd.+"}

# OR
node_filesystem_size_bytes{device=~"/dev/sda1|2"}

# contains
{job="apiserver", name=~".+extensions.+"}

# negation with contains
{job="apiserver", name!~".+k8s.+"}
```

## Prometheus API

### Examples
```sh
# call and get up function output via browser
<SERVER_IP|HOSTNAME>:<PORT>/api/v1/query?query=up

# call with curl with json pretty print
curl 'https://<SERVER_IP|HOSTNAME>:<PORT>/api/v1/query?query=up' | json_pp
# same
curl -G https://<SERVER_IP|HOSTNAME>:<PORT>/api/v1/query --data-urlencode 'query=up{env="test"}'
```