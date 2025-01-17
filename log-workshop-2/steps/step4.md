Collecting every type of data available is key to reducing your MTTR, because each type of data represents a new facet or a new approach to solving a given issue. To bind the data together, Datadog uses three tags:

* The `hostname` tag (or the `containerId` if working with containers)
* The `source` tag
* The `service` tag

### Hostname tag

The `hostname` (or `containerId`) tags  are collected automatically by the Datadog Agent. To overwrite these tags, edit the main `datadog.yaml` configuration file or use an environment variable.

### Source tag

**The source tag enables log integration pipelines and enforces the Datadog naming conventions**

Datadog has a wide range of log integrations. To enable the Log integration pipelines in Datadog, pass the source name as a value for the source attribute with a docker label. See the [full list of supported log sources](https://docs.datadoghq.com/logs/guide/integration-pipeline-reference/).

[Learn more about Datadog attribute naming convention](https://docs.datadoghq.com/logs/processing/attributes_naming_convention/).

### Service tag

**The service tag binds metrics traces and logs.**

It works automatically with known images, but if you have a custom application name, the service name may not match the services in APM, so you need to set it up with a custom label:

```yaml
labels:
      com.datadoghq.ad.logs: '[{"source": "python", "service": "users-api"}]'
```

In the Datadog Container Ecosystem, **Labels are key** to leveraging the most out of [Datadog Autodiscovery](https://docs.datadoghq.com/agent/autodiscovery/?tab=agent), if you look at your `docker-compose.yml` file at the root of the workshop directory, you can see that each container has associated labels:

```yaml
version: '3'
services:
  agent:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "agent", "service": "agent"}]'

  frontend:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "python", "service": "iot-frontend"}]'

  noder:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "python", "service": "users-api"}]'

  pumps:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "python", "service": "pumps-service"}]'

  redis:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "redis", "service": "redis"}]'

  sensors:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "python", "service": "sensors-api"}]'

  db:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "postgresql", "service": "postgres"}]'
```
