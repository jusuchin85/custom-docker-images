FROM ubuntu:14.04
LABEL maintainer=v8z3n28kq@mozmail.com
LABEL version=6.6
LABEL description="This is a custom Docker Image for the insecure OpenSSH version. Mainly used for generating insecure RSA private key pair with `ssh-rsa` signature."

# Operating system dependencies
RUN apt-get update && \
    apt-get install --yes --quiet build-essential git python wget libssl-dev zlib1g-dev

# Create sshd group and user
RUN mkdir /var/empty && \
    chown root:sys /var/empty && \
    chmod 755 /var/empty && groupadd sshd && \
    useradd -g sshd -c 'sshd privsep' -d /var/empty -s /bin/false sshd

# Install OpenSSH 7.2p1
RUN wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz && \
    tar -xzvf openssh-7.2p1.tar.gz -C /tmp && \
    cd /tmp/openssh-7.2p1 && \
    ./configure --with-md5-passwords --with-privsep-path=/var/empty --sysconfdir=/etc/ssh && \
    make && \
    make install

# Cleanup
RUN rm -rf /tmp/openssh-7.2p1 && \
    rm openssh-7.2p1.tar.gz

# Add user
RUN groupadd -r docker && useradd -r -g docker docker

USER docker
WORKDIR /home/docker
