# SSH Dev-Container
This repository contains a Docker container designed for easy and isolated remote development using JetBrains Gateway.

## Features
The SSH Dev-Container is highly customizable, allowing you to adapt it to your specific needs. 
To make modifications, simply fork this repository and edit the `src/Dockerfile`.

The current configuration of this container is tailored for personal use and includes the following features:

- Passwordless sudo
- Java 17
  - Java Runtime
  - Java Development Kit
  - Maven

## Getting Started
To use this container, follow these simple steps:

### Prerequisites
Make sure you have Docker installed and configured on your system.

### Starting the Container
To start the container, execute the following command:

```bash
docker run \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v workspace:/home/developer/workspace:ro \
  -e SSH_USER=developer \
  -e SSH_PASSWORD=password \
  -e SSH_KEY="" \
  -p 2222:22/tcp \
  ghcr.io/parzival-space/ssh-dev-container:latest
```

Alternatively, you can use the provided `docker-compose.yml` file if you prefer.

## License
This project is distributed under the MIT license.
For more information, please refer to the `LICENSE` file.