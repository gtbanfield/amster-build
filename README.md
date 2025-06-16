# amster
```
https://docs.pingidentity.com/forgeops/7.5/prepare/base-docker-images.html
```


```
Build the base image for Amster. This image must be available in order to build the base image for AM in the next step:

Unzip the Amster .zip file.

Change to the amster/samples/docker directory in the expanded .zip file output.

Run the setup.sh script:

$ ./setup.sh

+ mkdir -p build
+ find ../.. '!' -name .. '!' -name samples '!' -name docker -maxdepth 1 -exec cp -R '{}' build/ ';'
+ cp ../../docker/amster-install.sh ../../docker/docker-entrypoint.sh ../../docker/export.sh ../../docker/tar.sh build
Edit the Dockerfile in the samples/docker directory. Change the line:

FROM gcr.io/forgerock-io/java-17:latest
to:

FROM my-repo/java-17
Build the amster Docker image:

$ docker build --tag amster:7.5.0 .

 ⇒ [internal] load build definition from Dockerfile                                                                                          0.0s
 ⇒ ⇒ transferring dockerfile: 1.67kB                                                                                                         0.0s
 ⇒ [internal] load .dockerignore                                                                                                             0.0s
 ⇒ ⇒ transferring context: 2B                                                                                                                0.0s
 ⇒ [internal] load metadata for docker.io/my-repo/java-17:latest                                                                             1.1s
 ⇒ [1/8] FROM docker.io/my-repo/java-17
...
 ⇒ exporting to image
 ⇒ ⇒ exporting layers
 ⇒ ⇒ writing image sha256:bc47...f9e52                                                                                                       0.0s
 ⇒ ⇒ naming to docker.io/library/amster:7.5.0
```

