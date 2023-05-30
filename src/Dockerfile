FROM ubuntu:latest

# set metadata
LABEL authors="parzival-space" maintainer="parzival-space <me@parzival.space>" org.opencontainers.image.source="https://github.com/parzival-space/ssh-dev-container"
RUN date > /build.time # store build time

# set default variables
ENV SSH_USER "admin"
ENV SSH_PASSWORD "admin"
ENV SSH_KEY ""

# update system
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt full-upgrade -y

# prepare system
RUN apt install -y --no-install-recommends \
    ca-certificates \
    locales \
    sudo

# set the locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

# install ssh server \
RUN mkdir /run/sshd
RUN apt install -y --no-install-recommends \
    openssh-server

# install some usefull packages
RUN apt install -y --no-install-recommends \
    tar \
    curl \
    git

# install docker (for docker-in-docker support)
RUN curl -fsSL https://get.docker.com | sh

# install Java Development Kit
RUN apt install -y --no-install-recommends \
    openjdk-17-jre \
    openjdk-17-jdk \
    maven

# run ssh server
EXPOSE 22
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]