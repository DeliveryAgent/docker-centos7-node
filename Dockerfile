FROM deliveryagent/centos
MAINTAINER Tommy McNeely <tommy@lark-it.com>

#RUN yum -y install nodejs npm; \
#    yum clean all

ENV NODEJS_VERSION=v4.4.7 \
    PATH=/opt/node/current/bin:$PATH

# I dislike adding a compiler to a production server
RUN yum -y install make gcc gcc-c++ && yum -y clean all

# Install NODE
RUN mkdir /opt/node && \
    cd /opt/node && \
    curl -LSs https://nodejs.org/dist/${NODEJS_VERSION}/node-${NODEJS_VERSION}-linux-x64.tar.xz | tar xfJ - && \
    ln -sf  node-${NODEJS_VERSION}-linux-x64 current

CMD ["npm", "start"]
