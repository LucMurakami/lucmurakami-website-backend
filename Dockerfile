FROM node:12-alpine

RUN apk update && apk add -U nodejs yarn
RUN node --version
RUN yarn --version

RUN mkdir -p /var/www/api/

COPY . /var/www/api

RUN cd /var/www/api && yarn install

WORKDIR /var/www/api

EXPOSE 5000
CMD ["yarn", "start"]