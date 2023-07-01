FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential sudo unzip nano && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc

FROM base AS prime
ARG TAGS
RUN addgroup --gid 1000 alecwang && \
    adduser --gecos alecwang --uid 1000 --gid 1000 --disabled-password alecwang && \
    usermod -aG sudo alecwang && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER alecwang
WORKDIR /home/alecwang

FROM prime
COPY . .
RUN echo "alias pb='ansible-playbook main.yml'" >> /home/alecwang/.bashrc
CMD ["sh", "-c", "ansible-playbook main.yml"]
