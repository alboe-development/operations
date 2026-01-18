FROM debian:trixie-slim
MAINTAINER "ALBOE Development"

# Set Environment
ENV PUBLIC_KEY=""
ENV TZ="Etc/UTC"
ENV USER_NAME="alboe"

# System Setup
RUN mkdir -p /var/run/sshd;
RUN mkdir -p /usr/local/scripts
COPY ./start.sh /usr/local/scripts/start.sh
RUN chmod +x /usr/local/scripts/start.sh

# Install Dependencies
RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y openssh-server sudo tzdata;
RUN apt clean;

# Set Configurations
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config;

# Expose SSH Port
EXPOSE 22

# Expose Volume
VOLUME ["/home"]

# Container Start
CMD /usr/local/scripts/start.sh
