Let's kill a container and see what happens:

Check the list of running containers with `docker ps`{{execute}}

Kill the container named `log-workshop-*_pumps` with:

`docker kill <CONTAINER_ID>`{{copy}}

When trying to add a new pump in the application, nothing should happen, and the traceback should appear in the log explorer, but they are not parsed well, and the \n inside of them is messing with the log wrapping:

![traceback not wrapped](https://raw.githubusercontent.com/l0k0ms/workshops/master/log-workshop/images/traceback_not_wrapped.png)

There are two options to fix this:

1. Log in JSON format to always have the stack trace properly wrapped (Recommended)

2. Update the container label to specify to the Datadog Agent the pattern for a new log.

Let's update the label with the following rule:

```
  frontend:
    (...)
    labels:
      com.datadoghq.ad.logs: '[{"source": "python", "service": "iot-frontend", "log_processing_rules": [{"type": "multi_line", "name": "StackTraces", "pattern" : "(2019|Traceback)"}]}]'
```

**Reload your application**: `application_reload`{{execute}}

Stacktraces from the `iot-frontend` service are now properly wrapped in the Log explorer view:

![traceback properly wrapped](https://raw.githubusercontent.com/l0k0ms/workshops/master/log-workshop/images/traceback_properly_wrapped.png)
