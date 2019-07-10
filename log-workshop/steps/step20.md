Let's reload the application one more time: `application_reload`{{execute}}

Now execute this command `log_bomb`{{execute}} This should generate a huge amount of logs within Datadog.

Your mission, shall you accept it is to:

1. Understand what those logs are ([patterns](https://app.datadoghq.com/logs/patterns) might help you)
2. Parse them in order to extract all attributes possible.
3. Assign a status depending of the Status Code.

The relation between Log status and status code is:

| Status Code  |Log Status |
| ---          | ---       |
| [200 TO 299] | ok        |
| [300 TO 399] | notice    |
| [400 TO 499] | warning   |
| [500 TO 599] | error     |

If you succeed correctly the final result should look like this:

![log parsed](https://raw.githubusercontent.com/l0k0ms/workshops/master/log-workshop/images/log_parsed.png)

### Getting further

Add the facets: `http.status_code`, `http.url_details.path`, and `http.method` in order to benefit from specific UI enhancements.