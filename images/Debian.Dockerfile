# Latest stable - 'Buster'
FROM debian:10.1

# Cheers Docker, madlads
# https://docs.docker.com/engine/examples/running_ssh_service/

RUN apt update -y && apt upgrade -y

RUN apt install -y \
    openssh-server \
    openssh-client

RUN echo 'root:docker.io' | chpasswd

#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN mkdir -p -m0755 /var/run/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]