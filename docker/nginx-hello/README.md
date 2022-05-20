About
-----
FORKED FROM: https://github.com/shiwaforce/openshift-nginx-hello

**NGINX** running as webserver in a _non-root_ docker container that
serves a simple page containing the container's hostname, IP address and port
Running in OpenShift Container Platform, OpenShift Online, and OpenShift dedicated requires that your container be able to run as a random non-admin userid.

Based on:
 - https://github.com/nginxinc/NGINX-Demos/tree/master/nginx-hello
 - https://github.com/nginxinc/docker-nginx

How to run:
```
$ docker build -t nginx-hello .
$ docker run -P -d nginx-hello
```

Now, assuming we found out the IP address and the port that mapped to port 8080 on the container, in a browser we can make a request to the webserver and get the page.
The images were created to be used as simple backends for various load balancing demos.
