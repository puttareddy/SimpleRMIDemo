# RMI (Remote Method Invocation) DEMO
Simple RMI Java DEMO 

## Step-by-Step Instructions

Build and start the Docker containers:
Run the following command to build and start the Docker containers using Docker Compose:

```sh
docker-compose up --build
```
## check output
The rmi-client service will connect to the rmi-service, invoke the sayHello method, and print the response.

You should see output similar to the following in your console:

```
rmi-client_1  | Response: Hello, world!

```
