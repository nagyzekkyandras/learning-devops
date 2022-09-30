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

# sum
sum without(mode, cpu)(rate(node_cpu_seconds_total{mode!="idle"}[5m]))
sum without(fstype, mountpoint, device, job, service)(node_filesystem_size_bytes)
sum by(name)(container_cpu_usage_seconds_total)
sum by(instance)(rate(container_cpu_usage_seconds_total{id=~"/docker/.+"}[5m]))
sum by(release)(node_uname_info)

# count
count(up{job="node-exporter"})
count(up{job=~"node.+"})
count without(mode)(node_cpu_seconds_total)

# max
max(node_cpu_seconds_total{instance=~".+10.+", mode="idle"})

# min
min(node_cpu_seconds_total{instance=~".+10.+", mode="idle"})

# topk
topk(3,node_cpu_seconds_total{instance=~".+10.+", mode="idle"})

# bottomk
bottomk(4,node_cpu_seconds_total{instance=~".+10.+", mode="idle"})

# count_values
count_values by(release)("instance",node_uname_info)

# math examples
node_memory_MemTotal_bytes / (1024^3)
node_memory_MemTotal_bytes / 1.0737e+9
(node_memory_MemAvailable_bytes/node_memory_MemTotal_bytes) * 100
(1-node_memory_MemAvailable_bytes/node_memory_MemTotal_bytes) * 100 >= 30
(1-node_memory_MemAvailable_bytes/node_memory_MemTotal_bytes) * 100 >= bool 30
(sum by(instance)(node_filesystem_free_bytes)/ sum by(instance)(node_filesystem_size_bytes))*100

# operators
wmi_logical_disk_size_bytes or up{job="windows"} == 0
rate(process_cpu_seconds_total[5m]) unless process_resident_memory_bytes > 100 * (1024^2)
rate(process_cpu_seconds_total[5m]) and process_resident_memory_bytes > 100 * (1024^2)

# functions

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

# get the config
curl -G https://<SERVER_IP|HOSTNAME>:<PORT>/api/v1/status/config | json_pp
# get targets
curl -G https://<SERVER_IP|HOSTNAME>:<PORT>/api/v1/targets | json_pp
# get active targets
curl 'https://<SERVER_IP|HOSTNAME>:<PORT>/api/v1/targets?state=active'
# get dropped targets
curl 'https://<SERVER_IP|HOSTNAME>:<PORT>/api/v1/targets?state=dropped'
```