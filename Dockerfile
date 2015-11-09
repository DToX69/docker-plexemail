FROM linuxserver/baseimage.nginx
MAINTAINER smdion <me@seandion.com>
ENV APTLIST="python2.7 python-requests git inotify-tools"

#Applying stuff
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh


# Volumes and Ports
VOLUME /config
EXPOSE 80 443

