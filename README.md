# Docker Ubuntu Desktop

This repository contains a simple docker image for ubuntu desktop exposed over webbrowser with help of novnc and websockify.

## Setup

* To build this docker container run the following command

```bash
docker build -t ubuntu-latest-desktop . 
```

* To run this docker container run the following command

```bash
docker run --rm -it -d -p 8080:8080 ubuntu-latest-desktop

* To access the ubuntu desktop environment over web browser navigate to [http://localhost:8080](http://localhost:8080)
