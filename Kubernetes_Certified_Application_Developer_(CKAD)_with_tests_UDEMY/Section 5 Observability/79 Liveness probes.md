A liveness probe can be configured on the container
to periodically test whether the application
within the container is actually healthy.
If the test fails, the container is considered unhealthy
and is destroyed and recreated.

But again, as a developer, you get to define
what it means for an application to be healthy.
In case of a web application,
it could be when the API server is up and running.
In case of database,
you may test to see if a particular TCP Socket is listening,
or you may simply execute a command to perform a test.

| [[Readiness Probe http test]] | [[Readiness Probe tcp test]] | [[Readiness Probe Exec Command]]|
|-|-|-|

