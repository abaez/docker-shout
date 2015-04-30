FROM node
MAINTAINER [Alejandro Baez](https://twitter.com/a_baez)

RUN git clone https://github.com/erming/shout.git /opt/shout

RUN mkdir /config

WORKDIR /opt/shout
RUN npm install -g

expose 9000

cmd ["shout", "--home", "/config"]
