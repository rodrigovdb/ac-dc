FROM node:16.16.0

MAINTAINER Rodrigo VDB "rodrigovdb@gmail.com"

ENV INSTALL_PATH /var/app
RUN mkdir -p $INSTALL_PATH
COPY . $INSTALL_PATH/

WORKDIR $INSTALL_PATH

RUN npm install --location=global @angular/cli@13
RUN NODE_ENV=development npm install

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]