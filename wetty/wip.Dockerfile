FROM node/alpine
MAINTAINER Chris Diehl <cultclassik@gmail.com>

RUN apk update && \
  apk add vim git

RUN cd ~/ && git clone https://github.com/krishnasrinivas/wetty.git

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
