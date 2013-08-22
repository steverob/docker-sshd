##########################################
# A base Ubuntu 12.04 with SSHD service. #
##########################################
# Instructions:
#
# - Building:
#   * sudo docker build -t <yourname>/<container-name> .
#
# - Running (as daemon):
#    * SSHD_ID=$(sudo docker run -d -p 22 container -D)
#      -- The arguments you pass ('-D' in above case) will be passed as the argument to '/usr/sbin/sshd'
#
# - Connecting:
#    * Find the public facing port NAT-ed to the private exposed port 22
#       SSHD_PORT=$(sudo docker port $SSHD_ID 22)
#    
#     * Find IPAddress using 'ifconfig'.
#
#     * Connect with ssh:
#       ssh root@<ip-address> -p $SSHD_PORT
#
# - Party!
#
# - Visit docker.io for more on this awesome tool!


FROM ubuntu
MAINTAINER Steve Robinson

RUN apt-get -q -y  update
RUN apt-get -q -y install openssh-server
RUN mkdir /var/run/sshd
EXPOSE 22

RUN echo 'root:password' > /root/passwdfile
RUN cat /root/passwdfile | chpasswd

ENTRYPOINT ["/usr/sbin/sshd"]



