FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y gcc bzip2 gettext python-dev libkrb5-dev sshpass git&& \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  pip3 install pywinrm && \
  pip3 install pymssql && \
  pip3 install requests-credssp && \
  pip3 install elasticsearch && \
  pip3 install elasticsearch-dsl && \
  pip3 install jmespath && \
  pip3 install ansible-core==2.11.2 && \
  mkdir -p /etc/ansible && \
  touch /etc/ansible/hosts && \
  apt-get install vim -y && \
  pip3 install ansible-lint==5.3.2 && \
  pip3 install oci && \
  pip3 install lxml && \
  ansible-galaxy collection install oracle.oci -p /usr/share/ansible/collections && \
  ansible-galaxy collection install community.general -p /usr/share/ansible/collections && \
  ansible-galaxy collection install ansible.windows -p /usr/share/ansible/collections && \
  ansible-galaxy collection install community.windows -p /usr/share/ansible/collections && \
  ansible-galaxy collection install chocolatey.chocolatey -p /usr/share/ansible/collections && \
  ansible-galaxy collection install ansible.posix -p /usr/share/ansible/collections && \
  ansible-galaxy collection install azure.azcollection -p /usr/share/ansible/collections
COPY config/ansible.cfg /etc/ansible/ansible.cfg
#COPY config/inventory.ini /etc/ansible/inventory.ini
