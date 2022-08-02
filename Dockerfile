FROM node:16.16.0

MAINTAINER Rodrigo VDB "rodrigovdb@gmail.com"

RUN npm install -g @angular/cli@13

ENV INSTALL_PATH /var/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

EXPOSE 4200

CMD ["ng", "serve"]
